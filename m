Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFF635D87D
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 09:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236725AbhDMHIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 03:08:43 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:53457 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230391AbhDMHIg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 03:08:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WD9clhF3z43ycWD9glbIGa; Tue, 13 Apr 2021 09:08:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618297693; bh=LS6ap5bxhbb0fi6BvyUx1vQFPwQf2XLLgHjrUBuhD1U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BD3KA0nZ0bgTlnGook4CHgM3219Qz4VpVMHbXCrLNEf+tI2SBxiyOl/CjQIR4xwi/
         MJO4J88aSJ4LcH5P7IGgSE7Ib7SKSf5TtwDNqesb28MXnvQeDWzRZIQVHsxXuQ3nRJ
         ALxPeoAPBtf8EXyF/aIs70f99nB0mT0Eua0OwI9qqfXtUGjnnPYB41cGOMobrCRzgs
         Sk8D1hujJtMgDzssVbB3/Z+jnRjE6RJZdbZd3siegbXIMvryv1RKvzQFie0f5LLo17
         yqnYARo6897cU0WqIRTngiIFWgj4IxLXQ4Um5HtpjkXb1pOj196LYqYqWV/xP226ov
         mi3AAT/TP3FpA==
Subject: Re: [PATCHv2] v4l2-ctrls: fix reference to freed memory
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Yunfei Dong <yunfei.dong@mediatek.com>
References: <f756faa7-2853-906d-826f-f680beed8c7d@xs4all.nl>
 <CAPBb6MUSvaJgEy4HZvEErZ+=cCPCVqwrDULejh_PWW9EydJUEg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1cbfc53b-26e4-a0f6-7f3f-7b6dc51386bc@xs4all.nl>
Date:   Tue, 13 Apr 2021 09:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MUSvaJgEy4HZvEErZ+=cCPCVqwrDULejh_PWW9EydJUEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfONLBmpGamHsfBIoWtFv+u9DZJe693gdzJVN5r8Wn6mEYZ5BYnpTpV4pELVfHgxVOqte5qgrjApFEg3g11yv4DdyxdoYXxCf6IcjKd2CGO0/4cNjaThs
 K0GydmZJK343pjbIVwr1m6Fw/DS4N+ZH6JvGSsHQy819VKvZZjcGLgkWSD9Zfh2AF6qP1yuWpoM+InBWyp7SOugxnIeahjib2sbmB9XIWOWrbM0VmWfrFSQs
 BiaP+DSklwYe3ZKXTnV3b4Aynw3jmdS/U0+OhFwtVnGSPQs16MrSCvapjXUjpj9aX6xDNRO9hHUHNlSh4JaZeiyeG7ZjCSzSq26XaBnU6VI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/04/2021 04:43, Alexandre Courbot wrote:
> Hi Hans,
> 
> On Mon, Apr 12, 2021 at 8:51 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> When controls are used together with the Request API, then for
>> each request a v4l2_ctrl_handler struct is allocated. This contains
>> the controls that can be set in a request. If a control is *not* set in
>> the request, then the value used in the most recent previous request
>> must be used, or the current value if it is not found in any outstanding
>> requests.
>>
>> The framework tried to find such a previous request and it would set
>> the 'req' pointer in struct v4l2_ctrl_ref to the v4l2_ctrl_ref of the
>> control in such a previous request. So far, so good. However, when that
>> previous request was applied to the hardware, returned to userspace, and
>> then userspace would re-init or free that request, any 'ref' pointer in
>> still-queued requests would suddenly point to freed memory.
>>
>> This was not noticed before since the drivers that use this expected
>> that each request would always have the controls set, so there was
>> never any need to find a control in older requests. This requirement
>> was relaxed, and now this bug surfaced.
>>
>> The use of the 'req' pointer in v4l2_ctrl_ref was very fragile, so
>> drop this entirely. Instead add a valid_p_req bool to indicate that
>> p_req contains a valid value for this control. And if it is false,
>> then just use the current value of the control.
>>
>> Note that VIDIOC_G_EXT_CTRLS will always return -EACCES when attempting
>> to get a control from a request until the request is completed. And in
>> that case, all controls in the request will have the control value set
>> (i.e. valid_p_req is true). This means that the whole 'find the most
>> recent previous request containing a control' idea is pointless, and
>> the code can be simplified considerably.
>>
>> The v4l2_g_ext_ctrls_common() function was refactored a bit to make
>> it more understandable. It also avoids updating volatile controls
>> in a completed request since that was already done when the request
>> was completed.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
>> Cc: <stable@vger.kernel.org>      # for v5.9 and up
> 
> Tested-by: Alexandre Courbot <acourbot@chromium.org>
> 
> Thanks for this! I cannot reproduce the crash anymore on mtk-vcodec
> after hundreds of attempts.
> 
> Interestingly we are also running the same driver on a 4.19 kernel
> with requests support and H.264 stateless backported (up to and
> including "media: v4l2-ctrl: Lock main_hdl on operations of
> requests_queued") and we are not seeing this issue on that tree. So

Just for fun, try backporting 2fae4d6aabc8 ("media: v4l2-ctrls:
v4l2_ctrl_request_complete() should always set ref->req") and see if that
triggers the same bug in 4.19. I suspect that that patch makes the problem
more likely to happen.

Regards,

	Hans

> despite all evidence pointing to the initial request support there may
> also be other conditions where this issue does not manifest itself.
> Anyway for safety I will make sure to port this and the missing
> requests patches into that tree as well.
> 
> Cheers,
> Alex.
> 
>> ---
>> While the bug was actually introduced when the Request API was merged,
>> it was not in active use until the H.264 stateless codec API was made
>> part of the uAPI. That's why the CC to stable explicitly says v5.9 and
>> up, since this patch won't apply for older kernels, and that's OK since
>> it was not in active use AFAIK.
>>
>> If that assumption is wrong, then let me know and I will have to create
>> custom patches for older kernels, but I prefer to avoid doing that.
>>
>> I'm not planning to get this merged for 5.12 since we are close to a
>> release, so I think it is OK to get this in for 5.13 and have it backported
>> to 5.12. I also would like to have feedback from Alexandre and Yunfei
>> that this patch indeed fixes your issues as well.
>>
>> I plan on creating better tests in v4l2-compliance using vivid to verify
>> correct behavior of controls in requests. Proper tests are definitely
>> needed to avoid bugs like this.
>>
>> Changes since v1:
>> - drop find_ctrl_in_prev_request() as it is actually not needed
>> - refactor v4l2_g_ext_ctrls_common() a little bit to make it easier
>>   to understand
>>
>> Regards,
>>
>>         Hans
>> ---
>>  drivers/media/v4l2-core/v4l2-ctrls.c | 137 ++++++++++++---------------
>>  include/media/v4l2-ctrls.h           |  12 ++-
>>  2 files changed, 70 insertions(+), 79 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>> index c7bcc5c25771..0d7fe1bd975a 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>> @@ -2504,7 +2504,16 @@ static void new_to_req(struct v4l2_ctrl_ref *ref)
>>         if (!ref)
>>                 return;
>>         ptr_to_ptr(ref->ctrl, ref->ctrl->p_new, ref->p_req);
>> -       ref->req = ref;
>> +       ref->valid_p_req = true;
>> +}
>> +
>> +/* Copy the current value to the request value */
>> +static void cur_to_req(struct v4l2_ctrl_ref *ref)
>> +{
>> +       if (!ref)
>> +               return;
>> +       ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->p_req);
>> +       ref->valid_p_req = true;
>>  }
>>
>>  /* Copy the request value to the new value */
>> @@ -2512,8 +2521,8 @@ static void req_to_new(struct v4l2_ctrl_ref *ref)
>>  {
>>         if (!ref)
>>                 return;
>> -       if (ref->req)
>> -               ptr_to_ptr(ref->ctrl, ref->req->p_req, ref->ctrl->p_new);
>> +       if (ref->valid_p_req)
>> +               ptr_to_ptr(ref->ctrl, ref->p_req, ref->ctrl->p_new);
>>         else
>>                 ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->ctrl->p_new);
>>  }
>> @@ -3694,39 +3703,8 @@ static void v4l2_ctrl_request_queue(struct media_request_object *obj)
>>         struct v4l2_ctrl_handler *hdl =
>>                 container_of(obj, struct v4l2_ctrl_handler, req_obj);
>>         struct v4l2_ctrl_handler *main_hdl = obj->priv;
>> -       struct v4l2_ctrl_handler *prev_hdl = NULL;
>> -       struct v4l2_ctrl_ref *ref_ctrl, *ref_ctrl_prev = NULL;
>>
>>         mutex_lock(main_hdl->lock);
>> -       if (list_empty(&main_hdl->requests_queued))
>> -               goto queue;
>> -
>> -       prev_hdl = list_last_entry(&main_hdl->requests_queued,
>> -                                  struct v4l2_ctrl_handler, requests_queued);
>> -       /*
>> -        * Note: prev_hdl and hdl must contain the same list of control
>> -        * references, so if any differences are detected then that is a
>> -        * driver bug and the WARN_ON is triggered.
>> -        */
>> -       mutex_lock(prev_hdl->lock);
>> -       ref_ctrl_prev = list_first_entry(&prev_hdl->ctrl_refs,
>> -                                        struct v4l2_ctrl_ref, node);
>> -       list_for_each_entry(ref_ctrl, &hdl->ctrl_refs, node) {
>> -               if (ref_ctrl->req)
>> -                       continue;
>> -               while (ref_ctrl_prev->ctrl->id < ref_ctrl->ctrl->id) {
>> -                       /* Should never happen, but just in case... */
>> -                       if (list_is_last(&ref_ctrl_prev->node,
>> -                                        &prev_hdl->ctrl_refs))
>> -                               break;
>> -                       ref_ctrl_prev = list_next_entry(ref_ctrl_prev, node);
>> -               }
>> -               if (WARN_ON(ref_ctrl_prev->ctrl->id != ref_ctrl->ctrl->id))
>> -                       break;
>> -               ref_ctrl->req = ref_ctrl_prev->req;
>> -       }
>> -       mutex_unlock(prev_hdl->lock);
>> -queue:
>>         list_add_tail(&hdl->requests_queued, &main_hdl->requests_queued);
>>         hdl->request_is_queued = true;
>>         mutex_unlock(main_hdl->lock);
>> @@ -3783,7 +3761,7 @@ v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id)
>>  {
>>         struct v4l2_ctrl_ref *ref = find_ref_lock(hdl, id);
>>
>> -       return (ref && ref->req == ref) ? ref->ctrl : NULL;
>> +       return (ref && ref->valid_p_req) ? ref->ctrl : NULL;
>>  }
>>  EXPORT_SYMBOL_GPL(v4l2_ctrl_request_hdl_ctrl_find);
>>
>> @@ -3972,7 +3950,13 @@ static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
>>         return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
>>  }
>>
>> -/* Get extended controls. Allocates the helpers array if needed. */
>> +/*
>> + * Get extended controls. Allocates the helpers array if needed.
>> + *
>> + * Note that v4l2_g_ext_ctrls_common() with 'which' set to
>> + * V4L2_CTRL_WHICH_REQUEST_VAL is only called if the request was
>> + * completed, and in that case valid_p_req is true for all controls.
>> + */
>>  static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>>                                    struct v4l2_ext_controls *cs,
>>                                    struct video_device *vdev)
>> @@ -3981,9 +3965,10 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>>         struct v4l2_ctrl_helper *helpers = helper;
>>         int ret;
>>         int i, j;
>> -       bool def_value;
>> +       bool is_default, is_request;
>>
>> -       def_value = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
>> +       is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
>> +       is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
>>
>>         cs->error_idx = cs->count;
>>         cs->which = V4L2_CTRL_ID2WHICH(cs->which);
>> @@ -4009,11 +3994,9 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>>                         ret = -EACCES;
>>
>>         for (i = 0; !ret && i < cs->count; i++) {
>> -               int (*ctrl_to_user)(struct v4l2_ext_control *c,
>> -                                   struct v4l2_ctrl *ctrl);
>>                 struct v4l2_ctrl *master;
>> -
>> -               ctrl_to_user = def_value ? def_to_user : cur_to_user;
>> +               bool is_volatile = false;
>> +               u32 idx = i;
>>
>>                 if (helpers[i].mref == NULL)
>>                         continue;
>> @@ -4023,31 +4006,48 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>>
>>                 v4l2_ctrl_lock(master);
>>
>> -               /* g_volatile_ctrl will update the new control values */
>> -               if (!def_value &&
>> +               /*
>> +                * g_volatile_ctrl will update the new control values.
>> +                * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
>> +                * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
>> +                * it is v4l2_ctrl_request_complete() that copies the
>> +                * volatile controls at the time of request completion
>> +                * to the request, so you don't want to do that again.
>> +                */
>> +               if (!is_default && !is_request &&
>>                     ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
>>                     (master->has_volatiles && !is_cur_manual(master)))) {
>>                         for (j = 0; j < master->ncontrols; j++)
>>                                 cur_to_new(master->cluster[j]);
>>                         ret = call_op(master, g_volatile_ctrl);
>> -                       ctrl_to_user = new_to_user;
>> +                       is_volatile = true;
>>                 }
>> -               /* If OK, then copy the current (for non-volatile controls)
>> -                  or the new (for volatile controls) control values to the
>> -                  caller */
>> -               if (!ret) {
>> -                       u32 idx = i;
>>
>> -                       do {
>> -                               if (helpers[idx].ref->req)
>> -                                       ret = req_to_user(cs->controls + idx,
>> -                                               helpers[idx].ref->req);
>> -                               else
>> -                                       ret = ctrl_to_user(cs->controls + idx,
>> -                                               helpers[idx].ref->ctrl);
>> -                               idx = helpers[idx].next;
>> -                       } while (!ret && idx);
>> +               if (ret) {
>> +                       v4l2_ctrl_unlock(master);
>> +                       break;
>>                 }
>> +
>> +               /*
>> +                * Copy the default value (if is_default is true), the
>> +                * request value (if is_request is true and p_req is valid),
>> +                * the new volatile value (if is_volatile is true) or the
>> +                * current value.
>> +                */
>> +               do {
>> +                       struct v4l2_ctrl_ref *ref = helpers[idx].ref;
>> +
>> +                       if (is_default)
>> +                               ret = def_to_user(cs->controls + idx, ref->ctrl);
>> +                       else if (is_request && ref->valid_p_req)
>> +                               ret = req_to_user(cs->controls + idx, ref);
>> +                       else if (is_volatile)
>> +                               ret = new_to_user(cs->controls + idx, ref->ctrl);
>> +                       else
>> +                               ret = cur_to_user(cs->controls + idx, ref->ctrl);
>> +                       idx = helpers[idx].next;
>> +               } while (!ret && idx);
>> +
>>                 v4l2_ctrl_unlock(master);
>>         }
>>
>> @@ -4690,8 +4690,6 @@ void v4l2_ctrl_request_complete(struct media_request *req,
>>                 unsigned int i;
>>
>>                 if (ctrl->flags & V4L2_CTRL_FLAG_VOLATILE) {
>> -                       ref->req = ref;
>> -
>>                         v4l2_ctrl_lock(master);
>>                         /* g_volatile_ctrl will update the current control values */
>>                         for (i = 0; i < master->ncontrols; i++)
>> @@ -4701,21 +4699,12 @@ void v4l2_ctrl_request_complete(struct media_request *req,
>>                         v4l2_ctrl_unlock(master);
>>                         continue;
>>                 }
>> -               if (ref->req == ref)
>> +               if (ref->valid_p_req)
>>                         continue;
>>
>> +               /* Copy the current control value into the request */
>>                 v4l2_ctrl_lock(ctrl);
>> -               if (ref->req) {
>> -                       ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
>> -               } else {
>> -                       ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req);
>> -                       /*
>> -                        * Set ref->req to ensure that when userspace wants to
>> -                        * obtain the controls of this request it will take
>> -                        * this value and not the current value of the control.
>> -                        */
>> -                       ref->req = ref;
>> -               }
>> +               cur_to_req(ref);
>>                 v4l2_ctrl_unlock(ctrl);
>>         }
>>
>> @@ -4779,7 +4768,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
>>                                 struct v4l2_ctrl_ref *r =
>>                                         find_ref(hdl, master->cluster[i]->id);
>>
>> -                               if (r->req && r == r->req) {
>> +                               if (r->valid_p_req) {
>>                                         have_new_data = true;
>>                                         break;
>>                                 }
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index c1d20bd8f25f..a5953b812878 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -304,12 +304,14 @@ struct v4l2_ctrl {
>>   *             the control has been applied. This prevents applying controls
>>   *             from a cluster with multiple controls twice (when the first
>>   *             control of a cluster is applied, they all are).
>> - * @req:       If set, this refers to another request that sets this control.
>> + * @valid_p_req: If set, then p_req contains the control value for the request.
>>   * @p_req:     If the control handler containing this control reference
>>   *             is bound to a media request, then this points to the
>> - *             value of the control that should be applied when the request
>> + *             value of the control that must be applied when the request
>>   *             is executed, or to the value of the control at the time
>> - *             that the request was completed.
>> + *             that the request was completed. If @valid_p_req is false,
>> + *             then this control was never set for this request and the
>> + *             control will not be updated when this request is applied.
>>   *
>>   * Each control handler has a list of these refs. The list_head is used to
>>   * keep a sorted-by-control-ID list of all controls, while the next pointer
>> @@ -322,7 +324,7 @@ struct v4l2_ctrl_ref {
>>         struct v4l2_ctrl_helper *helper;
>>         bool from_other_dev;
>>         bool req_done;
>> -       struct v4l2_ctrl_ref *req;
>> +       bool valid_p_req;
>>         union v4l2_ctrl_ptr p_req;
>>  };
>>
>> @@ -349,7 +351,7 @@ struct v4l2_ctrl_ref {
>>   * @error:     The error code of the first failed control addition.
>>   * @request_is_queued: True if the request was queued.
>>   * @requests:  List to keep track of open control handler request objects.
>> - *             For the parent control handler (@req_obj.req == NULL) this
>> + *             For the parent control handler (@req_obj.ops == NULL) this
>>   *             is the list header. When the parent control handler is
>>   *             removed, it has to unbind and put all these requests since
>>   *             they refer to the parent.
>> --
>> 2.30.2
>>

