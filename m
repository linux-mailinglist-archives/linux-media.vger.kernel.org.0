Return-Path: <linux-media+bounces-60704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AKYCDoR/GkjLAAAu9opvQ
	(envelope-from <linux-media+bounces-60704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:12:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A94E2CC4
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E2E83025287
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 04:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDD431B824;
	Thu,  7 May 2026 04:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b="KIUb2vCd";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="YVWbcMRh"
X-Original-To: linux-media@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912DD2D59E8
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 04:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127154; cv=none; b=pqEr2RglRF7+9CieQcyj2iTXvSqTBvIvG0iUG0p9bid6iDzSxyyxci9RNutn0AQsjFAaqmzbP8Tst1+93dRA4Zn6wf1pPtJuk0+gNR3RFw5Z9ql0dT6DF81XLHghSTzKLizglepZUM9B4N5LfeMmC3tDQGbuSb4u/by/JT+8Mh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127154; c=relaxed/simple;
	bh=ksNZwP1dJGNhhXlR7TirkycPIhvvbe9kAdiewChEkao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwGg0JWIz1g832PlYAgYY4USDjxSJKAg22ctLKfL3CeYgFgwAaL+AqEcvBgsFSDdvXuLBCcPQuiBB2fN0hK2E1vV36Ja0LpNRSTzXnJLGg9U5uRV/eQzjbx/yJXNcrrMW4BO+RT31RZHU2dA8NpaneqAzePaP2E6VkxW2rR9p/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev; spf=pass smtp.mailfrom=q-lab.dev; dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b=KIUb2vCd; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=YVWbcMRh; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q-lab.dev
DKIM-Signature: a=rsa-sha256; b=KIUb2vCd7oLJkTnwKjVpfxsqACnG5qWwCFRu8/Hdn9tcHiAzpvp4I3CzW2C6T7jj/x5v6hDN6GZ19wXtoSFuTiE41/iwIt45npDeybbGwyr6dbjX8IZtFQ4CekZFLU2HK7DC5t+7bGx4H+jC3DSIR9bUdwzESokOFrb9+sez5GEsk1SCRC9ul+WS6fL8qgH8SiWBKGf6KWCa4d34J0iJlLtYMJHdg2tX27p6LB0p7AuJOj9k9W16Go49DFIXU9nbRprJJMDPjgMzBPoY58yYKMHgGlMmZypkDHwu4JXce4R0pU1KjXOEfIFpVQMjMWVt3M/JIft1wY7sOjon7mkB4Q==; s=purelymail1; d=q-lab.dev; v=1; bh=ksNZwP1dJGNhhXlR7TirkycPIhvvbe9kAdiewChEkao=; h=Received:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=YVWbcMRhzyTa0/9I96YebYulkD5VwA6XjP7FDbQJ8cL1XDkqBPs3LfgFg0tIP0KZ1RjHhr9K//6cqAmS6s0J8XyDijo2IilIPDKabvfMHWC9B8QA7MaS+wFHrI7IJB9+Ew1ixinDGWcYJyMAYbzOhjb8dLs8KL0pLLndQSawN0oht9fX9tqvb0PC9lycXAaqvfVTU/jjXE706IgH52GUurc0WqJlOhhRBXfamfPu8EVq13AlUZsYxPQA1xeDEKaQjkdRBISwDDfvUfwHmaQUJ0DarRwcmATPm3m81l2V/HeEl8T0UgwIteBhX982DpipSE0hEBRuIWqLN4Lcbe+fMg==; s=purelymail1; d=purelymail.com; v=1; bh=ksNZwP1dJGNhhXlR7TirkycPIhvvbe9kAdiewChEkao=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 284201:25281:null:purelymail
X-Pm-Original-To: linux-media@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -578679034;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 07 May 2026 04:12:22 +0000 (UTC)
Message-ID: <a7daefb2-3ab4-43db-b7cc-c3b7d0c0fae4@q-lab.dev>
Date: Wed, 6 May 2026 21:12:20 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor
 driver
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>, devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com>
Content-Language: en-US
From: Quentin Freimanis <quentin@q-lab.dev>
In-Reply-To: <20260306103614.3208182-3-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 646A94E2CC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[q-lab.dev,reject];
	R_DKIM_ALLOW(-0.20)[q-lab.dev:s=purelymail1,purelymail.com:s=purelymail1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60704-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,intel.com,vger.kernel.org,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quentin@q-lab.dev,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[q-lab.dev:+,purelymail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,q-lab.dev:mid,q-lab.dev:dkim]
X-Rspamd-Action: no action

On 3/6/26 2:36 AM, Alexander Shiyan wrote:
> +
> +static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ar0234 *ar0234 = container_of(ctrl->handler,
> +					     struct ar0234, ctrls);
> +	int ret = 0;
> +
> +	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
> +		return 0;
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		int exposure_max = ar0234->crop.height + ctrl->val - 1;
> +		int exposure_val = clamp(ar0234->exposure->val,
> +					 AR0234_EXPOSURE_MIN, exposure_max);
> +
> +		ret = __v4l2_ctrl_modify_range(ar0234->exposure,
> +					       AR0234_EXPOSURE_MIN,
> +					       exposure_max,
> +					       AR0234_EXPOSURE_STEP,
> +					       exposure_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (pm_runtime_get_if_in_use(ar0234->dev) == 0)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_HBLANK:
> +		cci_write(ar0234->regmap, AR0234_REG_LINE_LENGTH_PCK,
> +			  (ar0234->crop.width / 4) + ctrl->val, &ret);

should be (crop->width + ctrl->val) / 4, &ret) to keep the control in 
units of pixels

> +		break;
> +	case V4L2_CID_VBLANK:
> +		cci_write(ar0234->regmap, AR0234_REG_FRAME_LENGTH_LINES,
> +			  ar0234->crop.height + ctrl->val, &ret);
REG_FRAME_LENGTH_LINES seems to actually be total lines - 5

I had to make these 2 changes to be able to get the expected framerate 
when not using the default 120fps.

> +		if (ret)
> +			break;
> +		ctrl = ar0234->exposure;
> +		fallthrough;
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(ar0234->regmap, AR0234_REG_COARSE_INTEGRATION_TIME,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = ar0234_set_analog_gain(ar0234, ctrl->val);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
> +			  ctrl->val, &ret);
> +		break;
- Quentin

