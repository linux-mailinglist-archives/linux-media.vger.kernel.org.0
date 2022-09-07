Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43B45B0841
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 17:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbiIGPPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 11:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbiIGPPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 11:15:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91354E608
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 08:15:18 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwlp-0008Cw-2q; Wed, 07 Sep 2022 17:15:17 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVwlo-0007M5-IY; Wed, 07 Sep 2022 17:15:16 +0200
Date:   Wed, 7 Sep 2022 17:15:16 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v8 4/4] usb: gadget: uvc: add format/frame handling code
Message-ID: <20220907151516.GF18739@pengutronix.de>
References: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
 <20220907140254.2378109-5-m.grzeschik@pengutronix.de>
 <YxiztqqkMbWzMiVl@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A9z/3b/E4MkkD+7G"
Content-Disposition: inline
In-Reply-To: <YxiztqqkMbWzMiVl@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--A9z/3b/E4MkkD+7G
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Wed, Sep 07, 2022 at 06:07:34PM +0300, Laurent Pinchart wrote:
>On Wed, Sep 07, 2022 at 04:02:54PM +0200, Michael Grzeschik wrote:
>> The Hostside format selection is currently only done in userspace, as
>> the events for SET_CUR and GET_CUR are always moved to the application
>> layer. Since the v4l2 device parses the configfs data, the format
>> negotiation can be done in the kernel. This patch adds the functions to
>> set the current configuration while continuing to forward all unknown
>> events to the userspace level.
>
>Why do you think this is better done in kernel space, given that
>userspace has to process the event anyway ? It's more complexity in the
>kernel side, for little added value as far as I can see. It will also
>make it more difficult to handle different UVC versions (in particular
>UVC 1.5). I'd rather not go in this direction if there's no clear
>benefit.

The current case is to set configfs from userspace to ensure
the host sees only what we configured. Then the userspace has to parse
this configfs again, to be sure not to allow something on
SET_CUR/GET_CUR that is not valid from configfs configuration. Since the
configfs-Setup could be done from another application comming from
somewhere in the userspace this limit will always stay.

Since the kernel knows the configfs-setup it was given in the beginning
it can ensure that SET_CUR/GET_CUR will only handle valid setups.

When done in Kernel, we can also use simple v4l2 API calls like try_format =
to
ask the driver what the host side did configure. So we can use simple
abstracion-libs like gstreamer for this.

I thought I already mentioned this all in the Cover-Letter of this
series.

Michael

>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2:
>>    - fixed the commit message
>>    - changed pr_debug to pr_err in events_process_data
>>    - aligned many indentations
>>    - simplified uvc_events_process_data
>>    - fixed uvc_fill_streaming_control calls in uvcg_video_init
>>    - added setup_subscribed to decide if userspace takes over on EOPNOTS=
UPP
>>    - added data_subscribed to decide if userspace takes over on EOPNOTSU=
PP
>>    - removed duplicate send_response
>>    - wrting fmt and frm in full
>> v2 -> v3:
>>    - added find_format_index to set the right probe
>> v3 -> v4:
>>    - add function find_ival_index and use for cur_ival
>>    - fix swapped frame and format in uvc_events_process_data on uvc_fill=
_streaming_control
>>    - set proper resp.length on ep0 complete
>>    - dropped setting cur_probe on set_format since function was removed
>>    - added locking around getting correspondent cur_{frame,format,ival}
>> v4 -> v5:
>>    - fixed sparse errors reported by kernel test robot
>> v5 -> v6:
>>    - fixed the handling in uvc_function_ep0_complete after events_proces=
s_data
>> v6 -> v7:
>>    - set dwMaxPayloadTransferSize unconditionally from streaming_maxpack=
et
>>    - fixed check for interface with masking for 0xff
>> v7 -> v8:
>>    -
>>
>>  drivers/usb/gadget/function/f_uvc.c     | 237 +++++++++++++++++++++++-
>>  drivers/usb/gadget/function/uvc.h       |  19 ++
>>  drivers/usb/gadget/function/uvc_v4l2.c  |  66 ++++++-
>>  drivers/usb/gadget/function/uvc_video.c |  12 +-
>>  4 files changed, 322 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fu=
nction/f_uvc.c
>> index a8dcf5f01f16de..fc3fabc47018cd 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -16,7 +16,6 @@
>>  #include <linux/string.h>
>>  #include <linux/usb/ch9.h>
>>  #include <linux/usb/gadget.h>
>> -#include <linux/usb/g_uvc.h>
>>  #include <linux/usb/video.h>
>>  #include <linux/vmalloc.h>
>>  #include <linux/wait.h>
>> @@ -204,21 +203,228 @@ static const struct usb_descriptor_header * const=
 uvc_ss_streaming[] =3D {
>>   * Control requests
>>   */
>>
>> +void uvc_fill_streaming_control(struct uvc_device *uvc,
>> +			   struct uvc_streaming_control *ctrl,
>> +			   int iframe, int iformat, unsigned int ival)
>> +{
>> +	struct f_uvc_opts *opts;
>> +	struct uvcg_format *uformat;
>> +	struct uvcg_frame *uframe;
>> +
>> +	/* Restrict the iformat, iframe and ival to valid values. Negative
>> +	 * values for ifrmat and iframe will result in the maximum valid value
>> +	 * being selected
>> +	 */
>> +	iformat =3D clamp((unsigned int)iformat, 1U,
>> +			(unsigned int)uvc->header->num_fmt);
>> +	uformat =3D find_format_by_index(uvc, iformat);
>> +	if (!uformat)
>> +		return;
>> +
>> +	iframe =3D clamp((unsigned int)iframe, 1U,
>> +		       (unsigned int)uformat->num_frames);
>> +	uframe =3D find_frame_by_index(uvc, uformat, iframe);
>> +	if (!uframe)
>> +		return;
>> +
>> +	ival =3D clamp((unsigned int)ival, 1U,
>> +		     (unsigned int)uframe->frame.b_frame_interval_type);
>> +	if (!uframe->dw_frame_interval[ival - 1])
>> +		return;
>> +
>> +	opts =3D fi_to_f_uvc_opts(uvc->func.fi);
>> +
>> +	memset(ctrl, 0, sizeof(*ctrl));
>> +
>> +	ctrl->bmHint =3D 1;
>> +	ctrl->bFormatIndex =3D iformat;
>> +	ctrl->bFrameIndex =3D iframe;
>> +	ctrl->dwFrameInterval =3D uframe->dw_frame_interval[ival - 1];
>> +	ctrl->dwMaxVideoFrameSize =3D
>> +		uframe->frame.dw_max_video_frame_buffer_size;
>> +
>> +	ctrl->dwMaxPayloadTransferSize =3D opts->streaming_maxpacket;
>> +	ctrl->bmFramingInfo =3D 3;
>> +	ctrl->bPreferedVersion =3D 1;
>> +	ctrl->bMaxVersion =3D 1;
>> +}
>> +
>> +static int uvc_events_process_data(struct uvc_device *uvc,
>> +				   struct usb_request *req)
>> +{
>> +	struct uvc_video *video =3D &uvc->video;
>> +	struct uvc_streaming_control *target;
>> +	struct uvc_streaming_control *ctrl;
>> +	struct uvcg_frame *uframe;
>> +	struct uvcg_format *uformat;
>> +
>> +	switch (video->control) {
>> +	case UVC_VS_PROBE_CONTROL:
>> +		pr_debug("setting probe control, length =3D %d\n", req->actual);
>> +		target =3D &video->probe;
>> +		break;
>> +
>> +	case UVC_VS_COMMIT_CONTROL:
>> +		pr_debug("setting commit control, length =3D %d\n", req->actual);
>> +		target =3D &video->commit;
>> +		break;
>> +
>> +	default:
>> +		pr_err("setting unknown control, length =3D %d\n", req->actual);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	ctrl =3D (struct uvc_streaming_control *)req->buf;
>> +
>> +	uvc_fill_streaming_control(uvc, target, ctrl->bFrameIndex,
>> +			   ctrl->bFormatIndex, ctrl->dwFrameInterval);
>> +
>> +	if (video->control =3D=3D UVC_VS_COMMIT_CONTROL) {
>> +		uformat =3D find_format_by_index(uvc, target->bFormatIndex);
>> +		if (!uformat)
>> +			return -EINVAL;
>> +
>> +		uframe =3D find_frame_by_index(uvc, uformat, ctrl->bFrameIndex);
>> +		if (!uframe)
>> +			return -EINVAL;
>> +
>> +		spin_lock(&video->frame_lock);
>> +
>> +		video->cur_frame =3D uframe;
>> +		video->cur_format =3D uformat;
>> +		video->cur_ival =3D find_ival_index(uframe, ctrl->dwFrameInterval);
>> +
>> +		spin_unlock(&video->frame_lock);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void
>> +uvc_events_process_streaming(struct uvc_device *uvc, uint8_t req, uint8=
_t cs,
>> +			     struct uvc_request_data *resp)
>> +{
>> +	struct uvc_streaming_control *ctrl;
>> +
>> +	pr_debug("streaming request (req %02x cs %02x)\n", req, cs);
>> +
>> +	if (cs !=3D UVC_VS_PROBE_CONTROL && cs !=3D UVC_VS_COMMIT_CONTROL)
>> +		return;
>> +
>> +	ctrl =3D (struct uvc_streaming_control *)&resp->data;
>> +	resp->length =3D sizeof(*ctrl);
>> +
>> +	switch (req) {
>> +	case UVC_SET_CUR:
>> +		uvc->video.control =3D cs;
>> +		resp->length =3D 34;
>> +		break;
>> +
>> +	case UVC_GET_CUR:
>> +		if (cs =3D=3D UVC_VS_PROBE_CONTROL)
>> +			memcpy(ctrl, &uvc->video.probe, sizeof(*ctrl));
>> +		else
>> +			memcpy(ctrl, &uvc->video.commit, sizeof(*ctrl));
>> +		break;
>> +
>> +	case UVC_GET_MIN:
>> +	case UVC_GET_MAX:
>> +	case UVC_GET_DEF:
>> +		if (req =3D=3D UVC_GET_MAX)
>> +			uvc_fill_streaming_control(uvc, ctrl, -1, -1, UINT_MAX);
>> +		else
>> +			uvc_fill_streaming_control(uvc, ctrl, 1, 1, 0);
>> +		break;
>> +
>> +	case UVC_GET_RES:
>> +		memset(ctrl, 0, sizeof(*ctrl));
>> +		break;
>> +
>> +	case UVC_GET_LEN:
>> +		resp->data[0] =3D 0x00;
>> +		resp->data[1] =3D 0x22;
>> +		resp->length =3D 2;
>> +		break;
>> +
>> +	case UVC_GET_INFO:
>> +		resp->data[0] =3D 0x03;
>> +		resp->length =3D 1;
>> +		break;
>> +	}
>> +}
>> +
>> +static int
>> +uvc_events_process_class(struct uvc_device *uvc,
>> +			 const struct usb_ctrlrequest *ctrl,
>> +			 struct uvc_request_data *resp)
>> +{
>> +	unsigned int interface =3D le16_to_cpu(ctrl->wIndex) & 0xff;
>> +
>> +	if ((ctrl->bRequestType & USB_RECIP_MASK) !=3D USB_RECIP_INTERFACE)
>> +		return -EINVAL;
>> +
>> +	if (interface =3D=3D uvc->control_intf)
>> +		return -EOPNOTSUPP;
>> +	else if (interface =3D=3D uvc->streaming_intf)
>> +		uvc_events_process_streaming(uvc, ctrl->bRequest,
>> +					     le16_to_cpu(ctrl->wValue) >> 8,
>> +					     resp);
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +uvc_events_process_setup(struct uvc_device *uvc,
>> +			 const struct usb_ctrlrequest *ctrl,
>> +			 struct uvc_request_data *resp)
>> +{
>> +	uvc->video.control =3D 0;
>> +
>> +	pr_debug("bRequestType %02x bRequest %02x wValue %04x wIndex %04x wLen=
gth %04x\n",
>> +		ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
>> +		ctrl->wIndex, ctrl->wLength);
>> +
>> +	switch (ctrl->bRequestType & USB_TYPE_MASK) {
>> +	case USB_TYPE_STANDARD:
>> +		return -EOPNOTSUPP;
>> +
>> +	case USB_TYPE_CLASS:
>> +		return uvc_events_process_class(uvc, ctrl, resp);
>> +
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static void
>>  uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
>>  {
>>  	struct uvc_device *uvc =3D req->context;
>>  	struct v4l2_event v4l2_event;
>>  	struct uvc_event *uvc_event =3D (void *)&v4l2_event.u.data;
>> +	int ret;
>>
>>  	if (uvc->event_setup_out) {
>>  		uvc->event_setup_out =3D 0;
>>
>> -		memset(&v4l2_event, 0, sizeof(v4l2_event));
>> -		v4l2_event.type =3D UVC_EVENT_DATA;
>> -		uvc_event->data.length =3D req->actual;
>> -		memcpy(&uvc_event->data.data, req->buf, req->actual);
>> -		v4l2_event_queue(&uvc->vdev, &v4l2_event);
>> +		ret =3D uvc_events_process_data(uvc, req);
>> +		/* If we have a real error on process */
>> +		if (ret =3D=3D -EINVAL) {
>> +			struct uvc_request_data resp;
>> +
>> +			memset(&resp, 0, sizeof(resp));
>> +			resp.length =3D -EL2HLT;
>> +
>> +			uvc_send_response(uvc, &resp);
>> +		} else if (ret =3D=3D -EOPNOTSUPP && uvc->data_subscribed) {
>> +			memset(&v4l2_event, 0, sizeof(v4l2_event));
>> +			v4l2_event.type =3D UVC_EVENT_DATA;
>> +			uvc_event->data.length =3D req->actual;
>> +			memcpy(&uvc_event->data.data, req->buf, req->actual);
>> +			v4l2_event_queue(&uvc->vdev, &v4l2_event);
>> +		}
>>  	}
>>  }
>>
>> @@ -228,6 +434,8 @@ uvc_function_setup(struct usb_function *f, const str=
uct usb_ctrlrequest *ctrl)
>>  	struct uvc_device *uvc =3D to_uvc(f);
>>  	struct v4l2_event v4l2_event;
>>  	struct uvc_event *uvc_event =3D (void *)&v4l2_event.u.data;
>> +	struct uvc_request_data resp;
>> +	int ret =3D 0;
>>
>>  	if ((ctrl->bRequestType & USB_TYPE_MASK) !=3D USB_TYPE_CLASS) {
>>  		uvcg_info(f, "invalid request type\n");
>> @@ -245,6 +453,23 @@ uvc_function_setup(struct usb_function *f, const st=
ruct usb_ctrlrequest *ctrl)
>>  	uvc->event_setup_out =3D !(ctrl->bRequestType & USB_DIR_IN);
>>  	uvc->event_length =3D le16_to_cpu(ctrl->wLength);
>>
>> +	memset(&resp, 0, sizeof(resp));
>> +	resp.length =3D -EL2HLT;
>> +
>> +	ret =3D uvc_events_process_setup(uvc, ctrl, &resp);
>> +	/* If we have no error on process */
>> +	if (!ret)
>> +		return uvc_send_response(uvc, &resp);
>> +
>> +	/* If we have a real error on process */
>> +	if (ret !=3D -EOPNOTSUPP)
>> +		return ret;
>> +
>> +	/* If we have -EOPNOTSUPP */
>> +	if (!uvc->setup_subscribed)
>> +		return uvc_send_response(uvc, &resp);
>> +
>> +	/* If we have setup subscribed */
>>  	memset(&v4l2_event, 0, sizeof(v4l2_event));
>>  	v4l2_event.type =3D UVC_EVENT_SETUP;
>>  	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/func=
tion/uvc.h
>> index 8a71d0c4abbcd5..cdfd46f3a2861c 100644
>> --- a/drivers/usb/gadget/function/uvc.h
>> +++ b/drivers/usb/gadget/function/uvc.h
>> @@ -13,6 +13,8 @@
>>  #include <linux/mutex.h>
>>  #include <linux/spinlock.h>
>>  #include <linux/usb/composite.h>
>> +#include <linux/usb/g_uvc.h>
>> +#include <linux/usb/video.h>
>>  #include <linux/videodev2.h>
>>  #include <linux/wait.h>
>>
>> @@ -95,6 +97,12 @@ struct uvc_video {
>>  	unsigned int cur_ival;
>>
>>  	struct mutex mutex;	/* protects frame parameters */
>> +	spinlock_t frame_lock;
>> +
>> +	struct uvc_streaming_control probe;
>> +	struct uvc_streaming_control commit;
>> +
>> +	int control;
>>
>>  	unsigned int uvc_num_requests;
>>
>> @@ -131,6 +139,8 @@ struct uvc_device {
>>  	struct uvc_video video;
>>  	bool func_connected;
>>  	wait_queue_head_t func_connected_queue;
>> +	bool setup_subscribed;
>> +	bool data_subscribed;
>>
>>  	struct uvcg_streaming_header *header;
>>
>> @@ -187,5 +197,14 @@ extern struct uvcg_format *find_format_by_index(str=
uct uvc_device *uvc,
>>  extern struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
>>  					      struct uvcg_format *uformat,
>>  					      int index);
>> +extern int find_format_index(struct uvc_device *uvc,
>> +			       struct uvcg_format *uformat);
>> +extern int find_ival_index(struct uvcg_frame *uframe, int dwFrameInterv=
al);
>> +extern void uvc_fill_streaming_control(struct uvc_device *uvc,
>> +				       struct uvc_streaming_control *ctrl,
>> +				       int iframe, int iformat,
>> +				       unsigned int ival);
>> +extern int uvc_send_response(struct uvc_device *uvc,
>> +			     struct uvc_request_data *data);
>>
>>  #endif /* _UVC_GADGET_H_ */
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget=
/function/uvc_v4l2.c
>> index 3311e98a040537..e4c4bebd2ee860 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -90,6 +90,33 @@ struct uvcg_format *find_format_by_index(struct uvc_d=
evice *uvc, int index)
>>  	return uformat;
>>  }
>>
>> +int find_format_index(struct uvc_device *uvc, struct uvcg_format *uform=
at)
>> +{
>> +	struct uvcg_format_ptr *format;
>> +	int i =3D 1;
>> +
>> +	list_for_each_entry(format, &uvc->header->formats, entry) {
>> +		if (uformat =3D=3D format->fmt)
>> +			return i;
>> +		i++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int find_ival_index(struct uvcg_frame *uframe, int dwFrameInterval)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < uframe->frame.b_frame_interval_type; i++) {
>> +		if (dwFrameInterval =3D=3D uframe->dw_frame_interval[i])
>> +			return i + 1;
>> +	}
>> +
>> +	/* fallback */
>> +	return 1;
>> +}
>> +
>>  struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
>>  				       struct uvcg_format *uformat,
>>  				       int index)
>> @@ -178,8 +205,7 @@ static struct uvcg_frame *find_closest_frame_by_size=
(struct uvc_device *uvc,
>>   * Requests handling
>>   */
>>
>> -static int
>> -uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
>> +int uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *=
data)
>>  {
>>  	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
>>  	struct usb_request *req =3D uvc->control_req;
>> @@ -221,6 +247,8 @@ uvc_v4l2_get_format(struct file *file, void *fh, str=
uct v4l2_format *fmt)
>>  	struct uvc_video *video =3D &uvc->video;
>>  	struct uvc_format_desc *fmtdesc;
>>
>> +	spin_lock(&video->frame_lock);
>> +
>>  	fmtdesc =3D to_uvc_format(video->cur_format);
>>
>>  	fmt->fmt.pix.pixelformat =3D fmtdesc->fcc;
>> @@ -231,6 +259,8 @@ uvc_v4l2_get_format(struct file *file, void *fh, str=
uct v4l2_format *fmt)
>>  	fmt->fmt.pix.sizeimage =3D video->imagesize;
>>  	fmt->fmt.pix.priv =3D 0;
>>
>> +	spin_unlock(&video->frame_lock);
>> +
>>  	return 0;
>>  }
>>
>> @@ -255,6 +285,7 @@ uvc_v4l2_try_format(struct file *file, void *fh, str=
uct v4l2_format *fmt)
>>  	struct uvc_video *video =3D &uvc->video;
>>  	struct uvcg_format *uformat;
>>  	struct uvcg_frame *uframe;
>> +	int iformat;
>>  	u8 *fcc;
>>
>>  	if (fmt->type !=3D video->queue.queue.type)
>> @@ -270,6 +301,10 @@ uvc_v4l2_try_format(struct file *file, void *fh, st=
ruct v4l2_format *fmt)
>>  	if (!uformat)
>>  		return -EINVAL;
>>
>> +	iformat =3D find_format_index(uvc, uformat);
>> +	if (!iformat)
>> +		return -EINVAL;
>> +
>>  	uframe =3D find_closest_frame_by_size(uvc, uformat,
>>  				fmt->fmt.pix.width, fmt->fmt.pix.height);
>>  	if (!uframe)
>> @@ -314,8 +349,12 @@ uvc_v4l2_enum_frameintervals(struct file *file, voi=
d *fh,
>>  		if (fival->index >=3D 1)
>>  			return -EINVAL;
>>
>> +		spin_lock(&video->frame_lock);
>> +
>>  		fival->discrete.numerator =3D
>>  			uframe->dw_frame_interval[video->cur_ival - 1];
>> +
>> +		spin_unlock(&video->frame_lock);
>>  	} else {
>>  		if (fival->index >=3D uframe->frame.b_frame_interval_type)
>>  			return -EINVAL;
>> @@ -347,8 +386,12 @@ uvc_v4l2_enum_framesizes(struct file *file, void *f=
h,
>>  		if (fsize->index >=3D 1)
>>  			return -EINVAL;
>>
>> +		spin_lock(&video->frame_lock);
>> +
>>  		uformat =3D video->cur_format;
>>  		uframe =3D video->cur_frame;
>> +
>> +		spin_unlock(&video->frame_lock);
>>  	} else {
>>  		uformat =3D find_format_by_pix(uvc, fsize->pixel_format);
>>  		if (!uformat)
>> @@ -382,7 +425,11 @@ uvc_v4l2_enum_fmt(struct file *file, void *fh, stru=
ct v4l2_fmtdesc *f)
>>  		if (f->index >=3D 1)
>>  			return -EINVAL;
>>
>> +		spin_lock(&video->frame_lock);
>> +
>>  		uformat =3D video->cur_format;
>> +
>> +		spin_unlock(&video->frame_lock);
>>  	} else {
>>  		if (f->index >=3D uvc->header->num_fmt)
>>  			return -EINVAL;
>> @@ -506,14 +553,20 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>>  	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>>  		return -EINVAL;
>>
>> -	if (sub->type =3D=3D UVC_EVENT_SETUP && uvc->func_connected)
>> +	if (sub->type =3D=3D UVC_EVENT_STREAMON && uvc->func_connected)
>>  		return -EBUSY;
>>
>>  	ret =3D v4l2_event_subscribe(fh, sub, 2, NULL);
>>  	if (ret < 0)
>>  		return ret;
>>
>> -	if (sub->type =3D=3D UVC_EVENT_SETUP) {
>> +	if (sub->type =3D=3D UVC_EVENT_SETUP)
>> +		uvc->setup_subscribed =3D true;
>> +
>> +	if (sub->type =3D=3D UVC_EVENT_DATA)
>> +		uvc->data_subscribed =3D true;
>> +
>> +	if (sub->type =3D=3D UVC_EVENT_STREAMON) {
>>  		uvc->func_connected =3D true;
>>  		handle->is_uvc_app_handle =3D true;
>>  		uvc_function_connect(uvc);
>> @@ -543,7 +596,10 @@ uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>>  	if (ret < 0)
>>  		return ret;
>>
>> -	if (sub->type =3D=3D UVC_EVENT_SETUP && handle->is_uvc_app_handle) {
>> +	if (sub->type =3D=3D UVC_EVENT_SETUP)
>> +		uvc->setup_subscribed =3D false;
>> +
>> +	if (sub->type =3D=3D UVC_EVENT_STREAMON && handle->is_uvc_app_handle) {
>>  		uvc_v4l2_disable(uvc);
>>  		handle->is_uvc_app_handle =3D false;
>>  	}
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index 37867c93073418..c20d832c4a0b8a 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -533,10 +533,11 @@ static int uvc_default_frame_interval(struct uvc_v=
ideo *video)
>>   */
>>  int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>>  {
>> -	int iframe;
>> +	int iframe, iformat;
>>
>>  	INIT_LIST_HEAD(&video->req_free);
>>  	spin_lock_init(&video->req_lock);
>> +	spin_lock_init(&video->frame_lock);
>>  	INIT_WORK(&video->pump, uvcg_video_pump);
>>
>>  	if (list_empty(&uvc->header->formats))
>> @@ -547,6 +548,10 @@ int uvcg_video_init(struct uvc_video *video, struct=
 uvc_device *uvc)
>>  	if (!video->cur_format)
>>  		return -EINVAL;
>>
>> +	iformat =3D find_format_index(uvc, video->cur_format);
>> +	if (!iformat)
>> +		return -EINVAL;
>> +
>>  	iframe =3D uvc_frame_default(video->cur_format);
>>  	if (!iframe)
>>  		return -EINVAL;
>> @@ -557,6 +562,11 @@ int uvcg_video_init(struct uvc_video *video, struct=
 uvc_device *uvc)
>>
>>  	video->cur_ival =3D uvc_default_frame_interval(video);
>>
>> +	uvc_fill_streaming_control(uvc, &video->probe, iframe, iformat,
>> +				   video->cur_ival);
>> +	uvc_fill_streaming_control(uvc, &video->commit, iframe, iformat,
>> +				   video->cur_ival);
>> +
>>  	/* Initialize the video buffers queue. */
>>  	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
>>  			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
>
>--=20
>Regards,
>
>Laurent Pinchart
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--A9z/3b/E4MkkD+7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmMYtYEACgkQC+njFXoe
LGR4Bg//c5d+EAapbdh6Ib6Km5WZxoHf6tFiLdEB/8zt/8v5E8xjrYev0jiO2FGX
s8i0dw5BrdBL2i1AFxnhGaPcmhlzvaNMx430XKfqroZ/t2/VlZf3Nr4Rrf1LH0wR
E/W48u4+f7KhmYOAlrlLxYGehm41ht8kf6ZIxIuOlRGzeeILCXXQle4cJ/rIuHmm
jw76H/BHeTD9voGHXbHkA7ffEFXOLPFaHi7yQSj3/6Kvq/JNcCffkzIafubFHcxn
iWGkfjEEQSw92XLXr0RpdE3aoTSB0bMiRJ8p2VXkB2bXDu57SPWk7YMz/GlCqory
3weuwgkGDsvVhFChCAhbleiDv++qVQ+Vc0KhaBZ/bmkjMp0/hMnGJfKvvB3vrxjF
sU0ob467SLF79Honl0qLHv/H4IVDNxDBWqJsZx5ZPVohp9WbzsUVD0IRoIRm81I9
4V2Ciu++Srt4fDi1HRmayaPW+ubg2K02m6RJBssa8qvpgTD2IlnEhL8URZcVJEDU
th6m8lK7fIda+/f0Sf+r0jAEwLaC9Z/7bi7gTg8AxTWpkOE8nB0hqUVmrq/lHwjR
5pT2pEe2hrSwHLR0peTKOdMLnbTorlmJJjxhKF8mgFk2L2eVGq3dkJpbsv+22w5Q
Za6I7QByo4Zx6xHTPUjJdYiRQhGRqX13qQHPb8swspJw/RH8ASQ=
=B69K
-----END PGP SIGNATURE-----

--A9z/3b/E4MkkD+7G--
