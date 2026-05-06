Return-Path: <linux-media+bounces-60571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEDqGAQV+2lLWQMAu9opvQ
	(envelope-from <linux-media+bounces-60571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:16:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C144D9362
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D78BD3014FC8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059494014BC;
	Wed,  6 May 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAMIPBph"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96EF401491
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778062582; cv=none; b=Zwgzyot3LLT46yV3YMxwFa25iIaR41oUeoreHRwWjc8tZRU3HGIGPQG67BEROur7R0fS0K5RIcWuNmNuJ+2cT4d437x1gcMXAEKVCHl7bcQ9qf+CIyWjz6m8GMdfDXaiiFvaMul7bzWK5YOIPHkAIYnWKu8zj32kRLDhDjnJvaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778062582; c=relaxed/simple;
	bh=XHAbCn/groQfldwxdeD5Eyl+5lyhV01Ox5pQ7n8CcYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFRbw20iPsSG3Y0rZrvsrq+Cl+DzuwLITO391v0IAthu+IDCiAj/3PT+CL9P7Z5sAqNHGK9Mu6HcDjrik8Bws4VIE2u97+XECuW5mVQUEp7/IvoJ8Ctq07ze+EB/B8z+wYSBIKlZIh0EgjuOqi6rlWt45g4TKu0QtUWTbPv3quw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAMIPBph; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44a14580111so4063924f8f.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 03:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778062575; x=1778667375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MP5zUKceXITgWBoyT5sfmWgOMBr2j3wdzx/KXPcZhWU=;
        b=cAMIPBphJHWJxDFDTWPUXNVXs0VWMNEXBeuA7JOHOKXe9hJMJy0IQtO6680AnEHH7j
         Tvb3In1d4aF/qGkx5t7cchChhQoby6y5wsXmdThsRSRI7C9P0F25ihjokCohMVOLFcPw
         aFZ9Kuq3se+nFO5vpkm2CnYbygvlQpjtpG7/uTYCJ+bszzzTY+OMyJXsvQwrMF1LfI0w
         hjG18jwO33PEH7yPHFQc41PzYN1/pSgbfFZXgWQU+lSuUALSf7+t08orkdMTuAObbcH2
         u43LPRazt8rzNkawTIRq8qfcq208P2uK22dFtRRS24KjoVSSPEq+Cyflryxhekbz8gEv
         EEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778062575; x=1778667375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MP5zUKceXITgWBoyT5sfmWgOMBr2j3wdzx/KXPcZhWU=;
        b=remYDiASEmcJxiiePAQpj/oQ8Atm5cTOVjzr1aQy0pI9iZ358nJ/TBrfLIj52fhOgj
         6mFczLR8zWyjaoMGpOA7zRO0hBCvO8k+lltoyte9+dhN/C3MxdZu0TsCjDKZpb3BDAds
         1LrRUk64cH3V3XgOZJZTI7DC8UUeyJW8hEX6k4VN0+Bn3N5REJpzjHy0V+zZH+Uvu+gx
         6wEmDLJW1iwnkaf9mvZPus/7rloG+LHkGO26QcLS0bSNEaqiqDDAvpesWsRMT/UuRMs6
         6gyJxkpSoAdEc/ziGNDEJ74cgT66NdWgWLNjI5M7O9mYmehHFlk/YclzFa9lrQvpLSwW
         2WRg==
X-Forwarded-Encrypted: i=1; AFNElJ8QkYMmfdr/GjYCehISfSdt3Pgriit1R5TB0W56vsXiaQKqz4DV/2gGer/nZr5iPFwejUqwYSVq4qbzzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KEieJNk0gi1PNeuYLRObxlAVfs57dY+st24k6oCfeGZdcR/+
	QX6sA8y6c3hx3LQrSdskGdWmgIjAejR6V0x/Nz2Xe94BtgLsOWPsWfM2
X-Gm-Gg: AeBDieu2mIfZn8TPPMpmReC9/p2mOeRIbikCqQm1tG48Zs9DfwNzNf8wKMUEDiLUfJu
	figh+bujhu7otxsZOEp+8LMV9htx/CF8+Nwi17l7pkb6ulUaXziPTgHLAkcGVjtz46mcXIN4ieo
	WPMibjnZbJZEJMR73UgOok55mZs+bf3om9i0gf6pl5zD8aCEhVAhe7ni3QdzYAXSlmUrK+XtbPS
	Ga9yYdo8C8g/aJgdkG2Md/OwybN4lznUmydMiji2kFLEiwD57ifcyUbsIsLFvDLQd35oqjCuCex
	7QjBZ40+zVehFZP/yWPBMRRQTnpaYH6jtlWZnHex2gUCUKy1ojypGXZzXgq+7t59Q9NOd00NC2S
	iRb+qd5Vd09utuGVA9Xx86aAAYKED9xPk09X+5Dscc0w2b9N5dcNR6HybRcE/7SdYqMfUp+bKJ0
	u6HWVYriHASpLP360qaj3KIR8iF1u33O/JHOPgYD/bWxuOT8bUs3k1PnlVReWWfVlJlj4I55nKx
	Uwmft+p
X-Received: by 2002:a05:6000:2681:b0:441:1e41:194 with SMTP id ffacd0b85a97d-4515b525426mr4784852f8f.17.1778062575284;
        Wed, 06 May 2026 03:16:15 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:a1d:902c:85c8:d272? ([2a02:8109:8617:d700:a1d:902c:85c8:d272])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4504f4857ffsm11043763f8f.0.2026.05.06.03.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 03:16:14 -0700 (PDT)
Message-ID: <37aa90a3-7909-4605-a0be-1545db1fadb0@gmail.com>
Date: Wed, 6 May 2026 12:16:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: i2c: alvium: Fix controls for WB/AWB
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu, stable@vger.kernel.org,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505142513.1551721-1-mhecht73@gmail.com>
 <afsJz1vVdd3o-pe9@kekkonen.localdomain>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <afsJz1vVdd3o-pe9@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 03C144D9362
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-60571-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Sakari,

thank you for the comments.

On 5/6/26 11:28, Sakari Ailus wrote:
> Hi Martin,
> 
> Thanks for the patch.
> 
> On Tue, May 05, 2026 at 04:25:10PM +0200, Martin Hecht wrote:
>> With that patch the controls for red-balance and blue-balance were created
>> only if the particular camera supports that. Otherwise the pointers on
>> the control variable are initialized with NULL to prevent side effects for
>> clustering with AWB control.
>>
>> Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
>> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
>> ---
>>   drivers/media/i2c/alvium-csi2.c | 37 ++++++++++++++++++++-------------
>>   1 file changed, 22 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
>> index b62b45a4f2fc..4c6934e9e177 100644
>> --- a/drivers/media/i2c/alvium-csi2.c
>> +++ b/drivers/media/i2c/alvium-csi2.c
>> @@ -2108,26 +2108,33 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>>   						  0, 0, &alvium->link_freq);
>>   	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> This is a problem. Can you move setting the flags after checking the
> handler's error status? The functions adding controls may fail and this is
> simply a missing error check.
> 
> Can you submit a fix, with a Fixes: tag and this patch should be rebased on
> the fix, please?

I'm preparing a separate fix for that issue. It's the same situation 
also  for some other controls like pixel_rate and link_frequency but not 
only. Can I combine that into one patch for fix only that in 
alvium_ctrl_init?

> 
>>   
>> +	if (alvium->avail_ft.whiteb) {
>> +		ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
>> +							V4L2_CID_BLUE_BALANCE,
>> +							alvium->min_bbalance,
>> +							alvium->max_bbalance,
>> +							alvium->inc_bbalance,
>> +							alvium->dft_bbalance);
>> +		ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
>> +						       V4L2_CID_RED_BALANCE,
>> +						       alvium->min_rbalance,
>> +						       alvium->max_rbalance,
>> +						       alvium->inc_rbalance,
>> +						       alvium->dft_rbalance);
>> +	} else {
>> +		/* set to NULL for v4l2_ctrl_auto_cluster if not existing */
>> +		ctrls->blue_balance	= NULL;
>> +		ctrls->red_balance = NULL;
> 
> Aren't the two NULL already before this?

You are right. It's zeroed before because __GFP_ZERO in devm_kzalloc. 
Will remove that redundant code.

> 
>> +	}
>> +
>>   	/* Auto/manual white balance */
>>   	if (alvium->avail_ft.auto_whiteb) {
>>   		ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>>   						   V4L2_CID_AUTO_WHITE_BALANCE,
>>   						   0, 1, 1, 1);
>> -		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
>> -	}
>> -
>> -	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
>> -						V4L2_CID_BLUE_BALANCE,
>> -						alvium->min_bbalance,
>> -						alvium->max_bbalance,
>> -						alvium->inc_bbalance,
>> -						alvium->dft_bbalance);
>> -	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
>> -					       V4L2_CID_RED_BALANCE,
>> -					       alvium->min_rbalance,
>> -					       alvium->max_rbalance,
>> -					       alvium->inc_rbalance,
>> -					       alvium->dft_rbalance);
>> +
>> +		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, true);
>> +	}
>>   
>>   	/* Auto/manual exposure */
>>   	if (alvium->avail_ft.auto_exp) {
> 

BR Martin

