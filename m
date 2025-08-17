Return-Path: <linux-media+bounces-40043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB469B29441
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 18:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B6941963A39
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 16:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BCB3002DE;
	Sun, 17 Aug 2025 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Sayp2sr7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253ED16CD33
	for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 16:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755449212; cv=none; b=Tpa5YHbI239hjTJ2HR8nnkmb2+a2yr2fb6n8bUp25srvy6qEQuA6OmqeJ0ekGDsfOcRBIVuevHzIdgnksvU3zMkyq2h8Uh3OVOKHfliFhtIOpUTYS5BI0nZRrfGhdMdkkyHfRQ9S+rjmF05Vk+lzibweCNp6bTkHdtEKIxqPOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755449212; c=relaxed/simple;
	bh=wemZUqS+A99/VxPlNDzmg1mhu/qnaB75Q4d073x9468=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0HLWpFoTtoV8HW8aakQqm8nrZ4f56OpjQrYptvrbxW2w4qRlKnyxwk4832f2aFcaaq+4xq/sZBaIL14KDQ5/mW+qASRZe+63uoMIOnQSQGnZpTA8jWU55FwwO0fl56duwn8H3l6xCTp3N1cGmwRKt6BBGQIuewANGyTH3rl9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Sayp2sr7; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1755449208;
 bh=V0JgX9niK/jrh4YSavrLzHuTfEZE1FFWTu/eobrzLTk=;
 b=Sayp2sr7ACsvw8CnhuK71MfnNoHK2w+HgeroUX5Ju0r3GJOeJuvTaMXKKwlmAVn8KpZGj7UW3
 16Z5OlXdI8IwdGtKIAGa55m5KdzT5e0rQ7oZa4FXOHzHG2/6NE5poOKka7cI7QBoneXwgwp2pZs
 9JENLeiqsYBJMGw9DLrUT7dnEwlBvk8sl4MfhwwDiz6tb1bOsUQAxW0whXjHidN2PikmTtD4IY/
 sMSmZLKaWmtYBSWOizv7RGyiioHfqeb8C0qG+A6mEgOi1c4ROslVwzaJXRbcU70fO0Qko8ocyde
 HP0LvHPth28vIbZdCOk6FnWD2bBytuRM39Aqvenf+LaQ==
X-Forward-Email-ID: 68a207649a82a81f459cfa06
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <c0573db5-17df-4c8a-abfb-af7163f6b1b3@kwiboo.se>
Date: Sun, 17 Aug 2025 18:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-2-jonas@kwiboo.se> <22971824.EfDdHjke4D@earth>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <22971824.EfDdHjke4D@earth>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 8/12/2025 10:10 PM, Detlev Casanova wrote:
> Hi Jonas,
> 
> On Sunday, 10 August 2025 17:24:31 EDT Jonas Karlman wrote:
>> The Rockchip VDEC supports the HEVC codec with the Main and Main10
>> Profile up to Level 5.1 High tier: 4096x2304@60 fps.
>>
>> Add the backend for HEVC format to the decoder.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Changes in v2:
>> - Use new_value in transpose_and_flatten_matrices()
>> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
>> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
>> ---
>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  817 ++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    2 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   76 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>  6 files changed, 2745 insertions(+), 1 deletion(-)
>>  create mode 100644
>> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c create mode
>> 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>
> 
> [snip]
> 
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c new file mode 100644
>> index 000000000000..1994ea24f0be
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> 
> [snip]
> 
>> +
>> +static enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx
>> *ctx, +						       struct 
> v4l2_ctrl *ctrl)
>> +{
>> +	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
>> +
>> +	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
>> +		return RKVDEC_IMG_FMT_ANY;
>> +
>> +	if (sps->bit_depth_luma_minus8 == 0) {
>> +		if (sps->chroma_format_idc == 2)
>> +			return RKVDEC_IMG_FMT_422_8BIT;
> 
> Is 4:2:2 really supported ? It is not on rk3588 and likely neither on rk3576.
> You also mention later that Only 4:0:0 and 4:2:0 are supported.

On the older rkvdec it is not, and I was unsure about the newer SoCs at
the time of initial re-work of this. Regardless this is more correct
when only looking at this function, it does not include 4:4:4 but is
correct for all currently known RKVDEC_IMG_FMT. Also to keep this
function in sync with the h264 variant for more easy compare and less
confusion about the two down the line.

Regards,
Jonas

> 
>> +		else
>> +			return RKVDEC_IMG_FMT_420_8BIT;
>> +	} else if (sps->bit_depth_luma_minus8 == 2) {
>> +		if (sps->chroma_format_idc == 2)
>> +			return RKVDEC_IMG_FMT_422_10BIT;
> 
> Same here.
> 
> --
> Detlev.
> 
> 
> 


