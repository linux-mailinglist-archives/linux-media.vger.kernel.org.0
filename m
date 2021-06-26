Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3783B4F78
	for <lists+linux-media@lfdr.de>; Sat, 26 Jun 2021 18:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhFZQp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Jun 2021 12:45:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45232 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhFZQpZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Jun 2021 12:45:25 -0400
Received: from [IPv6:2804:14d:72b1:a2ff:e1:848c:62d:7304] (unknown [IPv6:2804:14d:72b1:a2ff:e1:848c:62d:7304])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BAD991F4088E;
        Sat, 26 Jun 2021 17:43:00 +0100 (BST)
Subject: Re: [RFC PATCHv2 02/11] v4l2-ctrls: add support for dynamically
 allocated arrays.
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
 <20210610113615.785359-3-hverkuil-cisco@xs4all.nl>
From:   Daniel Almeida <daniel.almeida@collabora.com>
Message-ID: <c9adc182-2167-26bd-e3a9-4a51fd619970@collabora.com>
Date:   Sat, 26 Jun 2021 13:42:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610113615.785359-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am sending this again because apparently I sent it originally from my 
personal email by mistake.

---------------


Hi Hans!

I have been working on testing this lately as you know.

 From the example you've added to vivid, i.e.:

+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
+    .ops = &vivid_user_gen_ctrl_ops,
+    .id = VIVID_CID_U32_DYN_ARRAY,
+    .name = "U32 Dynamic Array",
+    .type = V4L2_CTRL_TYPE_U32,
+    .flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+    .def = 50,
+    .min = 10,
+    .max = 90,
+    .step = 1,
+    .dims = { 100 },
+};
+

+    v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);


I was under the impression that it'd be enough to pass the id and 
V4L2_CTRL_FLAG_DYNAMIC_ARRAY in the config before calling 
v4l2_ctrl_new_custom. Apparently that's not the case though, because 
v4l2_ctrl_fill will then set its own flags if I understood correctly, i.e.:


     if (name == NULL)
         v4l2_ctrl_fill(cfg->id, &name, &type, &min, &max, &step,
                             &def,&flags)

<snip>

     *name = v4l2_ctrl_get_name(id);
     *flags = 0


<snip>


To be honest, I didn't quite understand whether you wanted individual 
drivers to signal they want to treat a given control as a dynamic array 
or whether I should add that flag in the switch statement in 
v4l2_ctrl_fill, thereby enabling this feature by default for all drivers 
that use that control if I understood correctly.

If the former, I was expecting to communicate it to userspace via a menu 
control, e.g. for h264 and cedrus:

enum v4l2_stateless_h264_decode_mode {
      V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED, /* i.e. a single 
slice per request */
      V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+    V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED, /* i.e. an array 
of slices per request */
  };

@@ -56,6 +56,7 @@ static const struct cedrus_control cedrus_controls[] = {
      {
          .cfg = {
              .id    = V4L2_CID_STATELESS_H264_SLICE_PARAMS,
+            .flags  = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
          },
          .codec        = CEDRUS_CODEC_H264,
      },
@@ -86,7 +87,7 @@ static const struct cedrus_control cedrus_controls[] = {
      {
          .cfg = {
              .id    = V4L2_CID_STATELESS_H264_DECODE_MODE,
-            .max    = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+            .max    = V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
              .def    = V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
          },
          .codec        = CEDRUS_CODEC_H264,

-- Daniel
