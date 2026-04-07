Return-Path: <linux-media+bounces-58152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M9lNkK11GnvwQcAu9opvQ
	(envelope-from <linux-media+bounces-58152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:41:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 350023AAE10
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43F7D30107FC
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 07:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A633A1E80;
	Tue,  7 Apr 2026 07:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgGrY2w0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EDB1C3BF7;
	Tue,  7 Apr 2026 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775547704; cv=none; b=mGfEuZ8LEeVyD5rU70H2+k0hxXx857lX86mbfnVkg3+A96eVe9yCzLXclucl9EZhWo6tENZwpauZjltofxMio4Ka7DvOfszPciPzKU+n3XzWhEJUhcbHVtgHWkejwc2KQQ+R5nX47Ber4Ed3lHO8DS6iGpIlkIjIOaX0cqHI060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775547704; c=relaxed/simple;
	bh=ot13fgGGPF9SQQOzfVUWEK9TwcYoeSTBU4g6a6CIqmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNptydjWM79bEsgPlB8KzrwIjSwPokXHTg6wSby4EPM73/3PpHfbACL3Vj/+0uwPuQSt/L5FYUhIdYXLwiNa6u8cWuL/IvStQrrpTM7P7fMhQJ9p2tOPIqtuuQdjZloY7KVq+BgW8RvHRiiILHN9JMqd/XA35JbeSTEjVlu4Lnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgGrY2w0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A40C116C6;
	Tue,  7 Apr 2026 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775547704;
	bh=ot13fgGGPF9SQQOzfVUWEK9TwcYoeSTBU4g6a6CIqmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EgGrY2w0I2rSD2V/sVgktDoWSbCIQHNp8lVA1ogrdxQVX59kECcoeUzHSdcDuUJVX
	 ng4jb/nzfyB88RyCJSUcWzACUYX/4DOcDnXpREhoD60IgwVUtwa6avZVJnuLzmaBTp
	 d9JpWAd3kIDEMXESB8qHtxjSVHL9Yy0NcRXKzyLSox27U/+tx3qmrWPOMm37zzwp/O
	 tYCvS3KFDFKwb4vvO6TCTDm4e+J2cD8FAwz7mCoOrEhEhNJe6DdMtd1dLGnqniM2CE
	 WTKDeNeLyaGBr3hpdOINokxiahaqMekAzxHeSaXAb3rPmoV51ahk5B+34KAFby6Cup
	 mxyf/2fnmjsRA==
Message-ID: <bbbd3a3d-7fe2-4402-957f-7b5098db4f2f@kernel.org>
Date: Tue, 7 Apr 2026 08:41:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: qcom: camss: csid: Rename en_vc to en_port
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Milen Mitkov <quic_mmitkov@quicinc.com>,
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <20260406-camss-rdi-fix-v1-5-d3f8b12473d0@kernel.org>
 <wflVmMMKix2FKJgQq_tfDVL_YdsMuAn1r-DABIDFBedSWeefoaN3CgKJdI92RaXjWc7n6RrcC--RWkAlR8olqg==@protonmail.internalid>
 <4d5b49c4-7142-48e9-af47-f996f10346f0@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <4d5b49c4-7142-48e9-af47-f996f10346f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58152-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 350023AAE10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 03:24, Hangxiang Ma wrote:
> On 4/7/2026 5:55 AM, bod@kernel.org wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> The en_vc mask has always also been an en_port mask. Name the variable for
>> what it does a bitmask of ports. When implementing v4l2 subdev streams it
>> probably makes more sense to have tuples for port/vc mappings. Such a
>> change right now feels like putting the cart before the horse.
>>
>> Sanitise the name in the interregnum.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss-csid-340.c  |  2 +-
>>    drivers/media/platform/qcom/camss/camss-csid-680.c  |  2 +-
>>    drivers/media/platform/qcom/camss/camss-csid-gen2.c |  4 ++--
>>    drivers/media/platform/qcom/camss/camss-csid-gen3.c |  6 +++---
>>    drivers/media/platform/qcom/camss/camss-csid.c      | 10 +++++-----
>>    drivers/media/platform/qcom/camss/camss-csid.h      |  2 +-
>>    6 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
>> index 5a7271785ec7a..da5e03b340bb7 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
>> @@ -119,7 +119,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>    	__csid_configure_rx(csid, &csid->phy);
>>
>>    	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>> -		if (csid->phy.en_vc & BIT(i)) {
>> +		if (csid->phy.en_port & BIT(i)) {
>>    			__csid_configure_rdi_stream(csid, enable, i, 0);
>>    			__csid_ctrl_rdi(csid, enable, i);
>>    		}
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> index 35a6bb209f97c..80d8bcd6e0854 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> @@ -292,7 +292,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>
>>           /* Loop through all enabled VCs and configure stream for each */
>>    	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>> -		if (csid->phy.en_vc & BIT(i)) {
>> +		if (csid->phy.en_port & BIT(i)) {
>>    			__csid_configure_rdi_stream(csid, enable, i, 0);
>>    			__csid_configure_rx(csid, &csid->phy, 0);
>>    			__csid_ctrl_rdi(csid, enable, i);
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index 331feed199094..e2d14b25f8c85 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -328,7 +328,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>    	u8 i;
>>    	/* Loop through all enabled VCs and configure stream for each */
>>    	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> -		if (csid->phy.en_vc & BIT(i)) {
>> +		if (csid->phy.en_port & BIT(i)) {
>>    			if (tg->enabled)
>>    				__csid_configure_testgen(csid, enable, i, 0);
>>
>> @@ -369,7 +369,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>
>>    	/* Read and clear IRQ status for each enabled RDI channel */
>>    	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> -		if (csid->phy.en_vc & BIT(i)) {
>> +		if (csid->phy.en_port & BIT(i)) {
>>    			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>>    			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>>    		}
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index 73504c349fd0b..b92234ba84efc 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -215,7 +215,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>
>>    	/* Loop through all enabled VCs and configure stream for each */
>>    	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> -		if (csid->phy.en_vc & BIT(i)) {
>> +		if (csid->phy.en_port & BIT(i)) {
>>    			__csid_configure_rdi_stream(csid, enable, i, 0);
>>    			__csid_configure_rx(csid, &csid->phy, 0);
>>    			__csid_ctrl_rdi(csid, enable, i);
>> @@ -263,7 +263,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>
>>    	/* Read and clear IRQ status for each enabled RDI channel */
>>    	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> -		if (csid->phy.en_vc & BIT(i)) {
>> +		if (csid->phy.en_port & BIT(i)) {
>>    			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>>    			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>>
>> @@ -309,7 +309,7 @@ static int csid_reset(struct csid_device *csid)
>>    	writel(1, csid->base + CSID_TOP_IRQ_MASK);
>>
>>    	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> -		if (csid->phy.en_vc & BIT(i)) {
>> +		if (csid->phy.en_port & BIT(i)) {
>>    			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>>    			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>>    			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>> index ed1820488c987..71a40c2cb350b 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -1278,21 +1278,21 @@ static int csid_link_setup(struct media_entity *entity,
>>    		csid->phy.lane_cnt = lane_cfg->num_data;
>>    		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
>>    	}
>> -	/* Decide which virtual channels to enable based on which source pads are enabled */
>> +	/* Decide which ports to enable based on which source pads are enabled */
>>    	if (local->flags & MEDIA_PAD_FL_SOURCE) {
>>    		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>>    		struct csid_device *csid = v4l2_get_subdevdata(sd);
>>    		struct device *dev = csid->camss->dev;
>>
>>    		if (flags & MEDIA_LNK_FL_ENABLED)
>> -			csid->phy.en_vc |= BIT(local->index - 1);
>> +			csid->phy.en_port |= BIT(local->index - 1);
>>    		else
>> -			csid->phy.en_vc &= ~BIT(local->index - 1);
>> +			csid->phy.en_port &= ~BIT(local->index - 1);
>>
>>    		csid->phy.need_vc_update = true;
>>
>> -		dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
>> -			__func__, csid->phy.en_vc);
>> +		dev_dbg(dev, "%s: Enabled CSID ports mask 0x%x\n",
>> +			__func__, csid->phy.en_port);
>>    	}
>>
>>    	return 0;
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
>> index aedc96ed84b2f..b227923ca5c15 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -68,7 +68,7 @@ struct csid_phy_config {
>>    	u8 csiphy_id;
>>    	u8 lane_cnt;
>>    	u32 lane_assign;
>> -	u32 en_vc;
>> +	u32 en_port;
>>    	u8 need_vc_update;
>>    };
>>
>>
> 
> I want to suggest a feasible way to solve this issue. The v4l2 framework
> provide a standard interface 'get_frame_desc' to acquire vc/dt, stream,
> format, etc. The vc/dt is determined by sensor in fact. Could we use
> this inteface to populate such information from sensor side and use them
> in csid? If sensor driver doesn't provide the desc, we can use the
> default vc0.
> 
> I have made some tests locally, the only gap is we need to determine the
> vc binding order and ask the user to follow it if multiple streams are
> configured simultaneously. Maybe we can handle this more flexible if we
> come up with new ideas.
> 
> Something like below
> 
> 1. Configure RDI0 first then RDI1 will get
>     RDI0 -> vc0
>     RDI1 -> vc1
> 2. Configure RDI1 first then RDI0 will get
>     RDI1 -> vc0
>     RDI0 -> vc1
> 
> Best regards,
> Hangxiang

I think there is a solution upstream we could reuse instead.

If you're interested in fixing this, I think the way to go is the 
set-route/set-routing syntax

- Add V4L2_SUBDEV_FL_STREAMS to CSID
- Support the routing syntax
- Continue to support the non-routing syntax
   i.e. when not doing set route, default to VC0 and not requiring
   the routing syntax to understand that VC0 is default

Let's pretend ov08x40 supports two VCs we want the existing syntax for 
the non-VC case to continue as-is

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"ov08x40 
'2-0036'":0[fmt:SGRBG10/3856x2416 field:none]'
media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGRBG10/3856x2416]'
media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p

And then the routing syntax - something like the following

media-ctl --reset

# Sensor format
media-ctl -V '"ov08x40 2-0036":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_csiphy4":0[fmt:SGRBG10/3856x2416]'

# CSID sink format
media-ctl -V '"msm_csid0":0[fmt:SGRBG10/3856x2416]'

# Route VC0 to pad1 (RDI0), VC1 to pad2 (RDI1)
media-ctl -R '"msm_csid0" [0/0->1/0[1], 0/1->2/0[1]]'

# Set format on each routed source pad
media-ctl -V '"msm_csid0":1[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_csid0":2[fmt:SGRBG10/3856x2416]'

# VFE sink formats
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGRBG10/3856x2416]'
media-ctl -V '"msm_vfe0_rdi1":0[fmt:SGRBG10/3856x2416]'

# Links
media-ctl -l '"msm_csiphy4":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'

# Capture VC0 on /dev/video2, VC1 on /dev/video3
yavta -B capture-mplane -c -n 1000 -f SGRBG10P -s 3856x2416 -F /dev/video2 &
yavta -B capture-mplane -c -n 1000 -f SGRBG10P -s 3856x2416 -F /dev/video3 &

---
bod

