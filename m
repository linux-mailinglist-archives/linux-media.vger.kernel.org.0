Return-Path: <linux-media+bounces-60327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /JNLFFtw+Wmu8gIAu9opvQ
	(envelope-from <linux-media+bounces-60327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 06:21:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A66584C6567
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 06:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9C4A30158B9
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 04:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060923AEF3B;
	Tue,  5 May 2026 04:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b="Rmsi5hSm";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="G8N2TVBp"
X-Original-To: linux-media@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC3214813
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 04:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777954899; cv=none; b=ESfI55CeZ6kBjLK1TtLV5Ld40RqkxdJSBAL4RR6lYdDnyD4dTm2uLjk5uLtIhUz5BePEqnAKt1XN6P9iIXhGSJP4EsoITwMC8E/piFH37XPMqED/Jhb2hlQxuDmi01W3WArt/BAYTWettWq/wkTOiWMj05LCijuEmnY1cdtdLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777954899; c=relaxed/simple;
	bh=rsbtrwoNteIeG4Ft1aA7m24bGGBadiqhJUwN9fwPGzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y90eZ6RPHQupCg01NQX1Qaed3ILjedw6ok3/pb8QPhcCIlM9neI4Oe8inJEhn9ByZTNs73202owpMbVbCSxlB1z3g8IcuQZgJ+liinMXK4ZkSaPwHoSflVQ0aC5os7q9VHugxpyB9013f45B6o+qZft+dNTY3aPH0jzfaRbdT4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev; spf=pass smtp.mailfrom=q-lab.dev; dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b=Rmsi5hSm; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=G8N2TVBp; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q-lab.dev
DKIM-Signature: a=rsa-sha256; b=Rmsi5hSmFq9CEojmDWWkJLoIzThtwjpm3jQDUanzKMUfYD8sMldRxedFF7KmO28C0vNkiUxeCf6PFHV2TvNzvfD49aEXSpfffT5j4oUs8VExJuRzoTaj2YviWqkPmFRyui94gsqYjS6z5dpHknv0N4r9zT5ddOpME06Eu4fr9JZh3Jb9/WkwodmEs/mY073KC1Hxbxa3U6KA43qS+PgOwusG+cupHsI5tm54C3cJ+9lOwTm4flqEBg6c4DO7wzHuvVVO8lFhKaqDlhgk1eHd3BL89I1ttqAk6uWb2Rt9w8mmKOnUx0Jvl5JQTRjxHWS/MiXxSQ5PAU1CEKgHQ+GTYQ==; s=purelymail3; d=q-lab.dev; v=1; bh=rsbtrwoNteIeG4Ft1aA7m24bGGBadiqhJUwN9fwPGzA=; h=Received:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=G8N2TVBpRdlKrvfoFlpLUGmRKiThzebKH/CWFyqWJL4e+f8RRpa6WckXXpqG42+yjVNKeTH74t7zQFyB/D5o/dQsvDgI9VxpnIccTODuQx/VCKcMU1TBbutAkXa6+8wIkPUSOWMXHgj1NVH4IuJ3+hXe1lsc8HUJo02+C7BguJRwlfdFHGPGj9J0G/ukBOQ51O0vlVSYG9eUqoYdHEGX2hnh9rn3OuwKYf01QhqNJkyxb5Co798U5tTKED05QEf7xztSMIeUFu0j2oD6yB32HtF3M4PyhBOpWlA86sQ+csypNRv4tTypEKkczaNasdDFCIDwdx/knXo5H7mpsO9DNQ==; s=purelymail3; d=purelymail.com; v=1; bh=rsbtrwoNteIeG4Ft1aA7m24bGGBadiqhJUwN9fwPGzA=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 284201:25281:null:purelymail
X-Pm-Original-To: linux-media@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -864377277;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 05 May 2026 04:21:29 +0000 (UTC)
Message-ID: <9bda558f-8ddd-49e1-ac5f-1f64a37fefb7@q-lab.dev>
Date: Mon, 4 May 2026 21:21:27 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
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
X-Rspamd-Queue-Id: A66584C6567
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[q-lab.dev,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[q-lab.dev:s=purelymail3,purelymail.com:s=purelymail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-60327-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[q-lab.dev:+,purelymail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quentin@q-lab.dev,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,intel.com,vger.kernel.org,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[purelymail.com:dkim,q-lab.dev:email,q-lab.dev:dkim,q-lab.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Alexander,

On 2026-03-06 2:36 a.m., Alexander Shiyan wrote:
> +static int ar0234_identify_module(struct ar0234 *ar0234)
> +{
> +	u64 id, rev;
> +	int ret;
> +
> +	ret = cci_read(ar0234->regmap, AR0234_REG_CHIP_VERSION, &id, NULL);
> +	ret = cci_read(ar0234->regmap, AR0234_REG_REVISION_NUMBER, &rev, &ret);
> +	if (ret)
> +		return dev_err_probe(ar0234->dev, ret,
> +				     "Failed to read chip id\n");
> +
> +	if (id == AR0234_CHIP_ID_MONO)
> +		ar0234->variant = AR0234_VARIANT_MONO;
> +	else if (id == AR0234_CHIP_ID)
> +		ar0234->variant = AR0234_VARIANT_COLOUR;
> +	else
> +		return dev_err_probe(ar0234->dev, -ENODEV,
> +				     "Invalid chip id: 0x%04x\n", (u16)id);
> +
> +	dev_info(ar0234->dev, "Success reading chip id: 0x%04x, Rev.%lld\n",
> +		 (u16)id, (rev >> 12) & 0xf);
> +
> +	return ret;
> +}
> +
> +static int ar0234_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ar0234->supplies),
> +				    ar0234->supplies);
> +	if (ret) {
> +		dev_err(ar0234->dev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ar0234->clk);
> +	if (ret) {
> +		dev_err(ar0234->dev, "Failed to enable clock\n");
> +		regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies),
> +				       ar0234->supplies);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ar0234->reset, 1);

should be 0 to de-assert the reset pin to power on

> +	/* ~160000 EXTCLKs */
> +	usleep_range(27000, 28000);
> +
> +	return 0;
> +}
> +
> +static int ar0234_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +
> +	gpiod_set_value_cansleep(ar0234->reset, 0);

1 to assert reset to power off

> +	regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies), ar0234->supplies);
> +	clk_disable_unprepare(ar0234->clk);
> +	/* 100ms PwrDown until next PwrUp */
> +	usleep_range(100000, 110000);
> +
> +	return 0;
> +}
> +
after fixing the reset polarity locally I got the driver working with a 
rgb ar0234cs in 4-lane 10bit mode using a 24mhz extclk and a 448MHz link 
frequency.

Tested-by: Quentin Freimanis <quentin@q-lab.dev>
(after the reset fix)

- Quentin

