Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07BACF4F48
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfKHPTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:19:55 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53791 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726036AbfKHPTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 10:19:54 -0500
Received: from [IPv6:2001:420:44c1:2577:2d08:b535:4aeb:85f0]
 ([IPv6:2001:420:44c1:2577:2d08:b535:4aeb:85f0])
        by smtp-cloud8.xs4all.net with ESMTPA
        id T63BiGVsLXYiTT63Fi0wGH; Fri, 08 Nov 2019 16:19:53 +0100
Subject: Re: [PATCH v4l-utils] v4l2-compliance: encoders should not support
 capture side G_PARM
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
References: <20191107114519.16624-1-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b1967fc7-71a7-88df-269d-7312573aeadd@xs4all.nl>
Date:   Fri, 8 Nov 2019 16:19:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191107114519.16624-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN8LQR2g9Ka8firN4A8Izh8L3hgb51va330lvnLRhFWz5GvYt5hemP+cQLB4FIVyP0pu/nZNDMkEsO2b0JRBltDgFxhiRdDbwjq2XXxhJ8otTAJL7Sii
 Pod4IrVVF4pmg2dDHV4WgW4wNd2aY64KeoU+b2vuk/UbJUG4x0jjc4NN4UT4NYK/65kSSrIWR/rj8csxvGkZFq/bvqyqBc94lYqIhorErpoqOj2wmXAMh1qn
 9EUSM5kvfcHGmqYlCcHbxwezLAwNCHfsu3LI0xieEmDZ3S84P6QGqqPjHSgGdsVydaHkkQlPWS8HBehesSOznuxeT8wUgoHojwDuFDYB60g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/7/19 12:45 PM, Philipp Zabel wrote:
> Encoders that implement output side G/S_PARM and ENUM_FRAMEINTERVALS
> to allow setting the nominal bitstream frame rate cause compliance
> failures:
> 
> 		fail: v4l2-test-formats.cpp(1330): ret && node->has_frmintervals
> 	test VIDIOC_G/S_PARM: FAIL
> 
> because v4l2-compliance is missing capture side G/S_PARM. Skip the
> frameinterval check and make sure that capture side G_PARM fails.

It is completely undocumented that G/S_PARM should be valid only for the OUTPUT
type.

My opinion is that for M2M devices G/S_PARM should be valid for both CAPTURE
and OUTPUT. The framerate is a property of the m2m device itself, and both
queues share this information.

vidioc_enum_frameintervals is also shared between both queues.

For the stateful encoder spec I was planning to make this explicit: i.e. G/S_PARM
can be called for both capture and output buf types. And it should be mentioned
in the G/S_PARM documentation as well.

I think it makes sense, and I also think that that means that this test doesn't
need to be changed (but the coda driver does).

Regards,

	Hans

> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  utils/v4l2-compliance/v4l2-test-formats.cpp | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index b87e59c8be69..7336a823a269 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -1283,6 +1283,11 @@ static int testParmType(struct node *node, unsigned type)
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		if (IS_ENCODER(node)) {
> +			fail_on_test(ret == 0);
> +			break;
> +		}
> +		/* fallthrough */
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		if (type && (node->g_caps() & buftype2cap[type]))
> 

