Return-Path: <linux-media+bounces-63788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wWU4LpVxIWoQGgEAu9opvQ
	(envelope-from <linux-media+bounces-63788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 14:37:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 485D263FEEB
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 14:37:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ixit.cz header.s=dkim header.b=LjK2y7ug;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63788-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63788-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ixit.cz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E39C30D37F5
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 12:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2A546AEDF;
	Thu,  4 Jun 2026 12:34:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306D1472784;
	Thu,  4 Jun 2026 12:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576495; cv=none; b=egMqGFy1o6vet+NMovGgJbsflTNskJwmuY1yROKyFp+fj/75303ydmeGWBadBtijzkzCCJZ20BYehTBAFiXiZVV7KVEojLQ46+sF9jDC7ejX8/51g7o1xa6cb59jtrhJrr/DKs93om7ugeHpQBa3DIEFz9lPjaWHx5GQwEIcmKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576495; c=relaxed/simple;
	bh=2ZVHVO43AQ0rzTwmrn7t63oTTdMEF5KVYB3LA+l3sQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVRRQDVwVSl6mcnib8cZhrtxWlMAsNlRo+n5xK3O2fkVxdR/mSEgvyx4NWQnQojZz/IkgtLcdru2LKhh0wzLADLwm21cKQmwc67Ac86ZLoNb5u7pmxB5bVXLXffG0fzZ/apdGzpW95LPfv3ywfU00NdGFTTrIcOIfP5VOAgfMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=LjK2y7ug; arc=none smtp.client-ip=185.100.197.86
Received: from [192.168.88.252] (ip-94-112-34-59.bb.vodafone.cz [94.112.34.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id CA600534115B;
	Thu, 04 Jun 2026 14:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1780576490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5ASx0Xe07YL+lNVAT9zg4eH04/+yRp7+fD+gmiJvLXE=;
	b=LjK2y7ugk2G+iuF+ywrfaT/R+j0Q7SRSsHwVUuKaSp2S7nx6BWL/7C2MKpTlC4HJaIt7pF
	C7FIUn2laRryIwAsl0wFE6K2vINMS9c3ZXKwSqjDYWGdgMQihiUrCA9HYLe/UIZoe4HDAu
	2RVL0+Vu7NcZEU+i12ggf4rTr0uPDzQ=
Message-ID: <43b7da84-3390-4094-a61f-9e887660eb10@ixit.cz>
Date: Thu, 4 Jun 2026 14:34:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY support
To: Frank Li <Frank.li@nxp.com>, Bryan O'Donoghue <bod@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
 <aiChDyKleAYuzjMg@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <aiChDyKleAYuzjMg@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63788-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:bod@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:dkim,ixit.cz:from_mime,ixit.cz:email,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 485D263FEEB

On 03/06/2026 23:47, Frank Li wrote:
> On Wed, Jun 03, 2026 at 01:30:41AM +0200, David Heidelberg wrote:
>> Inherit C-PHY information from CSIPHY, so we can configure CSID
>> properly.
>>
>> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Acked-by: Cory Keitz <ckeitz@amazon.com>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>>   drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>>   drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>>   3 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index eadcb2f7e3aaa..52ef730b10553 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -178,16 +178,17 @@ static void __csid_configure_rx(struct csid_device *csid,
>>   	int val;
>>
>>   	if (!lane_cnt)
>>   		lane_cnt = 4;
>>
>>   	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>   	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>>   	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
> 
> shift a bool type is not good habbit. some compiler may treat as undefine
> beheavor.
> 
> Frank

Oh I found out Bryan commented on the older revisions about the boolean usage.

So idea is convert this to:

+enum csid_phy_sel {
+       CSID_PHY_SEL_DPHY = 0,
+       CSID_PHY_SEL_CPHY = 1
+};
+

[...]

  struct csid_phy_config {
         u8 csiphy_id;
         u8 lane_cnt;
         u32 lane_assign;
         u32 en_vc;
         u8 need_vc_update;
-       bool cphy;
+       enum csid_phy_sel phy_sel;
  };

Frank, Bryan, snds good?

> 
>>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>>
>>   	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>>   	if (vc > 3)
>>   		val |= 1 << CSI2_RX_CFG1_VC_MODE;
>>   	val |= 1 << CSI2_RX_CFG1_MISR_EN;
>>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>>   }
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>> index 48459b46a981b..8d5c872f84ed5 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -1286,16 +1286,17 @@ static int csid_link_setup(struct media_entity *entity,
>>   			/* do no allow a link from CSIPHY to CSID */
>>   			if (!csiphy->cfg.csi2)
>>   				return -EPERM;
>>
>>   			csid->phy.csiphy_id = csiphy->id;
>>
>>   			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>>   			csid->phy.lane_cnt = lane_cfg->num_data;
>> +			csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
>>   			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
>>   			csid->tpg_linked = false;
>>   		}
>>   	}
>>   	/* Decide which virtual channels to enable based on which source pads are enabled */
>>   	if (local->flags & MEDIA_PAD_FL_SOURCE) {
>>   		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>>   		struct csid_device *csid = v4l2_get_subdevdata(sd);
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
>> index 5296b10f6bac8..00e2669db64c9 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -65,16 +65,17 @@ struct csid_testgen_config {
>>   };
>>
>>   struct csid_phy_config {
>>   	u8 csiphy_id;
>>   	u8 lane_cnt;
>>   	u32 lane_assign;
>>   	u32 en_vc;
>>   	u8 need_vc_update;
>> +	bool cphy;
>>   };
>>
>>   struct csid_device;
>>
>>   struct csid_hw_ops {
>>   	/*
>>   	 * configure_stream - Configures and starts CSID input stream
>>   	 * @csid: CSID device
>>
>> --
>> 2.53.0
>>

-- 
David Heidelberg


