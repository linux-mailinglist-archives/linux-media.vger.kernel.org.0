Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD6F215784
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 14:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgGFMoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 08:44:00 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33351 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729095AbgGFMn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jul 2020 08:43:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sQRDj8pEgBncFsQRHjvK6S; Mon, 06 Jul 2020 14:43:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594039434; bh=8F2TmOn83d1FtryLiBajmS/9uywwC87cqE1qHI2tvC4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=N9WVyPfUlPhycanOZAtZgecKkq80qFh+oJXgyoVY3wWWPN2yoVbcYkxWUZZX+Pp8U
         d4JgPgeJKw7aYKrGEZZ+q8u1BYOKlNMxEKLZNKsoUZAphxZnR5IwP+URp4Z6KroS+2
         SsRqe8ddv1Rm1miIvL87p31gHObGSAc6RiuDstOjaGbFk/1v/F74zoWvGj92KFVg3I
         aqZj689O9jI6QwCHTuTFurSBX4qsCzEEjUqkz1aggsdpLS3D2zPA/fK6z/nLDQa5Kg
         I+xxe6aSe6QpG+4VnXYyLPbHC0N0E0neG7+TCZUJ38nSu4vLVvTcT3NlUKHTf68peq
         CH2rwlH2ryTKg==
Subject: Re: [PATCH v2 16/18] media: mtk-vcodec: venc: make S_PARM return
 -ENOTTY for CAPTURE queue
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-17-acourbot@chromium.org>
 <84068e20-9a34-6d03-61e6-6c243680749c@xs4all.nl>
 <CAPBb6MW9deo11+YH9Mh3u08sEt7ShAF_a+S0-Jb_VDGhCQot_Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <74652f57-8dd8-6b24-9889-59bec389464e@xs4all.nl>
Date:   Mon, 6 Jul 2020 14:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MW9deo11+YH9Mh3u08sEt7ShAF_a+S0-Jb_VDGhCQot_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKcKT/KYVZiOxynAIfVI3ssaFh/UuQ5Kaf/XdhEeyookvFHb5HtVQlFVZdimI3i10tefi121PTR+fBcUS4grLGxynpn7k+9eILtm5mz80NClvVS0n9WE
 24ovQragdB9gw1o4cxDswZxfhjANOJ9sbfV5jQ1QVVAgjQVHldSkdq1x10CZZneSq1qJzi4PTAEbr9/slIFDxG5ZQI4fcN4SGZNj8LV/D/6wrqoyJOZKvcv0
 88n8XGejBhvSg/m9P6e3OQeuWy2Bfwrb8KfxnqwTkPCry2DxZFc9kX/1tgdvoo+stj98fVC6PnHaq3E3PhYwW63EmXODtln/ypwpTuwKNDUISsUEBtG04EAL
 DiLI+IfALI+fGSRV9iMXSUNwE1pOmU8SOCFQfQWbrxtiGJ00V4q/VFyE5osW+aga1UbGWz8yaHZv3/IjeVvguBgc9nrbtQg0tNevCUqhn8zIWypN7M6nzs+K
 aODiw6L1CRwORMOrAvxE5rEGbrBnV2xRzzTXQKetQ5/vw9Gq9H/ikMAYdps=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/07/2020 14:36, Alexandre Courbot wrote:
> On Fri, Jul 3, 2020 at 5:30 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 26/06/2020 10:04, Alexandre Courbot wrote:
>>> v4l2-compliance expects ENOTTY to be returned when a given queue does
>>> not support S_PARM.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>> ---
>>>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>>> index aae610e6d4e8..346a33c6869d 100644
>>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>>> @@ -200,7 +200,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
>>>       struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>>>
>>>       if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>>> -             return -EINVAL;
>>> +             return -ENOTTY;
>>
>> This doesn't look right: S_PARM *is* supported, just not for this buffer type.
>> So -EINVAL is the correct error code.
>>
>> What is the exact v4l2-compliance failure? It might be a bug in the test.
> 
> The error is as follows:
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>                 fail: v4l2-test-formats.cpp(1336): got error 22 when
> setting parms for buftype 9
>         test VIDIOC_G/S_PARM: FAIL

This is due to bugs in the compliance test that do not take into account the
stateful encoder spec.

The compliance test should check for the following:

If ENUM_FRAMEINTERVALS is implemented, then G/S_PARM shall be supported for OUTPUT.

If ENUM_FRAMEINTERVALS is not implemented, then G/S_PARM is optional for OUTPUT. But if
G_PARM is implemented, then S_PARM shall also be implemented. In this case the
frame interval range is determined by the codec standard.

If V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL is set for one or more pixel formats,
then G/S_PARM shall be implemented for both CAPTURE and OUTPUT.

For backwards compatibility: if G/S_PARM is supported for OUTPUT, then it may be
supported for CAPTURE as well.

Can you try with the following patch?

With this v4l2-compliance patch you should be able to drop patches 15/18 and 16/18
of your series.

Regards,

	Hans

-------------------------- cut here ------------------------------
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b5bde2f4..d0441651 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1250,6 +1250,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 		node.frmsizes.clear();
 		node.frmsizes_count.clear();
 		node.has_frmintervals = false;
+		node.has_enc_cap_frame_interval = false;
 		node.valid_buftypes = 0;
 		node.valid_memorytype = 0;
 		node.buf_caps = 0;
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 21e31872..ae10bdf9 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -141,6 +141,7 @@ struct base_node {
 	frmsizes_set frmsizes;
 	frmsizes_count_map frmsizes_count;
 	bool has_frmintervals;
+	bool has_enc_cap_frame_interval;
 	__u32 valid_buftypes;
 	__u32 valid_buftype;
 	__u32 valid_memorytype;
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 3dfc593e..edf1536e 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -71,6 +71,8 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
 		ret = doioctl(node, VIDIOC_ENUM_FRAMEINTERVALS, &frmival);
 		if (ret == ENOTTY)
 			return ret;
+		// M2M devices don't support this, except for stateful encoders
+		fail_on_test(node->is_m2m && !(node->codec_mask & STATEFUL_ENCODER));
 		if (f == 0 && ret == EINVAL) {
 			if (type == V4L2_FRMSIZE_TYPE_DISCRETE)
 				warn("found framesize %dx%d, but no frame intervals\n", w, h);
@@ -264,16 +266,22 @@ static int testEnumFormatsType(struct node *node, unsigned type)
 			return fail("drivers must never set the emulated flag\n");
 		if (fmtdesc.flags & ~(V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_EMULATED |
 				      V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
-				      V4L2_FMT_FLAG_DYN_RESOLUTION))
+				      V4L2_FMT_FLAG_DYN_RESOLUTION |
+				      V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL))
 			return fail("unknown flag %08x returned\n", fmtdesc.flags);
 		if (!(fmtdesc.flags & V4L2_FMT_FLAG_COMPRESSED))
 			fail_on_test(fmtdesc.flags & (V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
-						      V4L2_FMT_FLAG_DYN_RESOLUTION));
+						      V4L2_FMT_FLAG_DYN_RESOLUTION |
+						      V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL));
 		ret = testEnumFrameSizes(node, fmtdesc.pixelformat);
 		if (ret)
 			fail_on_test(node->codec_mask & STATEFUL_ENCODER);
 		if (ret && ret != ENOTTY)
 			return ret;
+		if (fmtdesc.flags & V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL) {
+			fail_on_test(!(node->codec_mask & STATEFUL_ENCODER));
+			node->has_enc_cap_frame_interval = true;
+		}
 		f++;
 		if (type == V4L2_BUF_TYPE_PRIVATE)
 			continue;
@@ -1222,6 +1230,7 @@ int testSlicedVBICap(struct node *node)

 static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
 {
+	bool is_stateful_enc = node->codec_mask & STATEFUL_ENCODER;
 	struct v4l2_captureparm *cap = &parm.parm.capture;
 	struct v4l2_outputparm *out = &parm.parm.output;
 	int ret;
@@ -1239,6 +1248,7 @@ static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
 			fail_on_test(!cap->readbuffers);
 		fail_on_test(cap->capability & ~V4L2_CAP_TIMEPERFRAME);
 		fail_on_test(node->has_frmintervals && !cap->capability);
+		fail_on_test(is_stateful_enc && !cap->capability);
 		fail_on_test(cap->capturemode & ~V4L2_MODE_HIGHQUALITY);
 		if (cap->capturemode & V4L2_MODE_HIGHQUALITY)
 			warn("V4L2_MODE_HIGHQUALITY is poorly defined\n");
@@ -1257,6 +1267,7 @@ static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
 		else if (node->g_caps() & V4L2_CAP_STREAMING)
 			fail_on_test(!out->writebuffers);
 		fail_on_test(out->capability & ~V4L2_CAP_TIMEPERFRAME);
+		fail_on_test(is_stateful_enc && !out->capability);
 		fail_on_test(out->outputmode);
 		fail_on_test(out->extendedmode);
 		if (out->capability & V4L2_CAP_TIMEPERFRAME)
@@ -1271,6 +1282,7 @@ static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
 static int testParmType(struct node *node, unsigned type)
 {
 	struct v4l2_streamparm parm;
+	bool is_stateful_enc = node->codec_mask & STATEFUL_ENCODER;
 	int ret;

 	memset(&parm, 0, sizeof(parm));
@@ -1288,10 +1300,10 @@ static int testParmType(struct node *node, unsigned type)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		if (type && (node->g_caps() & buftype2cap[type]))
+		if (node->g_caps() & buftype2cap[type]) {
 			fail_on_test(ret && node->has_frmintervals);
-		if (ret)
-			break;
+			fail_on_test(ret && node->has_enc_cap_frame_interval);
+		}
 		break;
 	default:
 		fail_on_test(ret == 0);
@@ -1300,8 +1312,15 @@ static int testParmType(struct node *node, unsigned type)
 		fail_on_test(!doioctl(node, VIDIOC_S_PARM, &parm));
 		break;
 	}
+	if (ret == ENOTTY) {
+		memset(&parm, 0, sizeof(parm));
+		parm.type = type;
+		fail_on_test(doioctl(node, VIDIOC_S_PARM, &parm) != ENOTTY);
+	}
 	if (ret == ENOTTY)
 		return ret;
+	// M2M devices don't support this, except for stateful encoders
+	fail_on_test(node->is_m2m && !is_stateful_enc);
 	if (ret == EINVAL)
 		return ENOTTY;
 	if (ret)
@@ -1327,11 +1346,29 @@ static int testParmType(struct node *node, unsigned type)
 		cap = parm.parm.output.capability;
 	else
 		cap = parm.parm.capture.capability;
-	fail_on_test(ret && node->has_frmintervals);
-	if (!ret && (cap & V4L2_CAP_TIMEPERFRAME) && !node->has_frmintervals)
+
+	if (is_stateful_enc) {
+		fail_on_test(ret && node->has_enc_cap_frame_interval);
+		if (V4L2_TYPE_IS_OUTPUT(type))
+			fail_on_test(ret);
+	} else {
+		fail_on_test(ret && node->has_frmintervals);
+	}
+
+	/*
+	 * Stateful encoders can support S_PARM without ENUM_FRAMEINTERVALS.
+	 * being present. In that case the limits of the chosen codec apply.
+	 */
+	if (!ret && (cap & V4L2_CAP_TIMEPERFRAME) && !node->has_frmintervals && !is_stateful_enc)
 		warn("S_PARM is supported for buftype %d, but not for ENUM_FRAMEINTERVALS\n", type);
 	if (ret == ENOTTY)
 		return 0;
+	/*
+	 * S_PARM(CAPTURE) is optional for stateful encoders, so EINVAL is a
+	 * valid error code in that case.
+	 */
+	if (is_stateful_enc && !V4L2_TYPE_IS_OUTPUT(type) && ret == -EINVAL)
+		return 0;
 	if (ret)
 		return fail("got error %d when setting parms for buftype %d\n", ret, type);
 	fail_on_test(parm.type != type);
-------------------------- cut here ------------------------------
