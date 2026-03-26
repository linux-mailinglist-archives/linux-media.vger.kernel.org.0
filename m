Return-Path: <linux-media+bounces-57167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKpiLidfxWlM9wQAu9opvQ
	(envelope-from <linux-media+bounces-57167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:30:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CE33867B
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E44F300DEE2
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42524070F7;
	Thu, 26 Mar 2026 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="cjiUQbwb"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E894014B5;
	Thu, 26 Mar 2026 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542328; cv=none; b=iThb63eQQngK3CqPm9UNVz3FzU/5Mqb2bMg2ZIBwl/q3TdqrcOXfPyRzSJyTpYLmxUgvuMJpvDNfi0q8+mKSxXcZv+ynJllfE/gSp9sxa/JJW4iBump86tQt7QSTZqTsRE65WtvXjIGNZH05jeZhWHqkqJjvSClWlQBNGx58HtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542328; c=relaxed/simple;
	bh=qF6gRDc8RYgoX+No8kzyA59zdoU3O7W1kBS00VWobyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSCD+BWr0XjjtAggn24eC50TYe//Tvi7Z5Q2M7VB2omAUE5RYbckS5klu6JWnZoCwcXDtE1Vvtr18oJo3MLA/PiaNMvfE2ZKSPvNwWd8sX6KJbqW0qmk5HFIQL/BgiRnir8ozMkuB/mQkH0MpzNYgTav+ZR9kpSJNXo2dj+gA9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=cjiUQbwb; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4UuansGauhhO4oWioGAsAw03xo3dgsUr/Pr5BJ42cQ4=; b=cjiUQbwbHseDGJ892BMJTMm3hF
	UUBNuOFN1tRdW4DieTlOHxlZ70eZyXIeUL8K+AnPEWRhORvpAhmGl+yRfZ8GhdLjLc9qQK0nXZLip
	t+T2pSGDzdUCpav2VnUifFsI18X6XoF66zlJB9kKP0knQ7NAHaov3gyv4sruUl2Xkv3g=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:52693 helo=[192.168.0.207])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend.oss@emfend.at>)
	id 1w5nWE-00GGZa-AL; Thu, 26 Mar 2026 17:25:15 +0100
Message-ID: <0faf22b3-e20a-40ce-b628-54d33e123e0d@emfend.at>
Date: Thu, 26 Mar 2026 17:25:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] media: i2c: ov08d10: add support for reset and
 power management
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Fend <matthias.fend@emfend.at>
Cc: Jimmy Su <jimmy.su@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
 <20260324-ov08d10-v3-8-1e44069cf91e@emfend.at>
 <acU0Gky-EldJlx0t@kekkonen.localdomain>
Content-Language: de-DE
From: Matthias Fend <matthias.fend.oss@emfend.at>
In-Reply-To: <acU0Gky-EldJlx0t@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57167-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.861];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend.oss@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 696CE33867B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Am 26.03.2026 um 14:26 schrieb Sakari Ailus:
> Hi Matthias,
> 
> A few more minor comments.
> 
> On Tue, Mar 24, 2026 at 11:41:42AM +0100, Matthias Fend wrote:
>> Add support for the required power supplies as well as the control of an
>> optional sensor reset.
>>
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   drivers/media/i2c/ov08d10.c | 93 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 92 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
>> index ce0fa30a86129302b5dda0b8796e44054fd77c88..19035991e8bb164d4fca5d87ee4551191974e8bb 100644
>> --- a/drivers/media/i2c/ov08d10.c
>> +++ b/drivers/media/i2c/ov08d10.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-fwnode.h>
>> @@ -513,9 +514,17 @@ static const char * const ov08d10_test_pattern_menu[] = {
>>   	"Standard Color Bar",
>>   };
>>   
>> +static const char *const ov08d10_supply_names[] = {
>> +	"dovdd",	/* Digital I/O power */
>> +	"avdd",		/* Analog power */
>> +	"dvdd",		/* Digital core power */
>> +};
>> +
>>   struct ov08d10 {
>>   	struct device *dev;
>>   	struct clk *clk;
>> +	struct reset_control *reset;
>> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov08d10_supply_names)];
>>   
>>   	struct v4l2_subdev sd;
>>   	struct media_pad pad;
>> @@ -1265,6 +1274,56 @@ static const struct v4l2_subdev_internal_ops ov08d10_internal_ops = {
>>   	.open = ov08d10_open,
>>   };
>>   
>> +static int ov08d10_power_off(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov08d10 *ov08d10 = to_ov08d10(sd);
>> +
>> +	reset_control_assert(ov08d10->reset);
>> +
>> +	regulator_bulk_disable(ARRAY_SIZE(ov08d10->supplies),
>> +			       ov08d10->supplies);
>> +
>> +	clk_disable_unprepare(ov08d10->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov08d10_power_on(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov08d10 *ov08d10 = to_ov08d10(sd);
>> +	int ret;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov08d10->supplies),
>> +				    ov08d10->supplies);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to enable regulators: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(ov08d10->clk);
>> +	if (ret < 0) {
>> +		regulator_bulk_disable(ARRAY_SIZE(ov08d10->supplies),
>> +				       ov08d10->supplies);
>> +
>> +		dev_err(dev, "failed to enable imaging clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (ov08d10->reset) {
>> +		/* Delay from DVDD stable to sensor XSHUTDN pull up: 5ms */
>> +		fsleep(5 * USEC_PER_MSEC);
>> +
>> +		reset_control_deassert(ov08d10->reset);
>> +
>> +		/* Delay from XSHUTDN pull up to SCCB start: 8ms */
>> +		fsleep(8 * USEC_PER_MSEC);
> 
> Don't you need the fsleep()'s (or at least the latter one) even if you have
> no reset GPIO?

Good point. I couldn't find any explicit information in the datasheet 
about operating without a hardware reset.

While I didn't encounter any problems during my tests without a reset, 
that's probably just coincidence, and I think it's a good idea to wait 
for the delay you suggested in any case.

> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int ov08d10_identify_module(struct ov08d10 *ov08d10)
>>   {
>>   	struct i2c_client *client = v4l2_get_subdevdata(&ov08d10->sd);
>> @@ -1371,6 +1430,10 @@ static void ov08d10_remove(struct i2c_client *client)
>>   	media_entity_cleanup(&sd->entity);
>>   	v4l2_ctrl_handler_free(sd->ctrl_handler);
>>   	pm_runtime_disable(ov08d10->dev);
>> +	if (!pm_runtime_status_suspended(ov08d10->dev)) {
>> +		ov08d10_power_off(ov08d10->dev);
>> +		pm_runtime_set_suspended(ov08d10->dev);
>> +	}
>>   	mutex_destroy(&ov08d10->mutex);
>>   }
>>   
>> @@ -1378,6 +1441,7 @@ static int ov08d10_probe(struct i2c_client *client)
>>   {
>>   	struct ov08d10 *ov08d10;
>>   	unsigned long freq;
>> +	unsigned int i;
>>   	int ret;
>>   
>>   	ov08d10 = devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
>> @@ -1403,12 +1467,32 @@ static int ov08d10_probe(struct i2c_client *client)
>>   		return ret;
>>   	}
>>   
>> +	ov08d10->reset = devm_reset_control_get_optional_exclusive(ov08d10->dev, NULL);
> 
> This is a bit long.
> 
> I'll take the set now but please post a fix on top.

I just posted a fixup. I hope it was as you intended.

Thanks
  ~Matthias

> 
>> +	if (IS_ERR(ov08d10->reset))
>> +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
>> +				     "failed to get reset\n");
>> +	reset_control_assert(ov08d10->reset);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
>> +		ov08d10->supplies[i].supply = ov08d10_supply_names[i];
>> +
>> +	ret = devm_regulator_bulk_get(ov08d10->dev,
>> +				      ARRAY_SIZE(ov08d10->supplies),
>> +				      ov08d10->supplies);
>> +	if (ret)
>> +		return dev_err_probe(ov08d10->dev, ret,
>> +				     "failed to get regulators\n");
>> +
>>   	v4l2_i2c_subdev_init(&ov08d10->sd, client, &ov08d10_subdev_ops);
>>   
>> +	ret = ov08d10_power_on(ov08d10->dev);
>> +	if (ret)
>> +		return dev_err_probe(ov08d10->dev, ret, "failed to power on\n");
>> +
>>   	ret = ov08d10_identify_module(ov08d10);
>>   	if (ret) {
>>   		dev_err(ov08d10->dev, "failed to find sensor: %d\n", ret);
>> -		return ret;
>> +		goto probe_error_power_off;
>>   	}
>>   
>>   	mutex_init(&ov08d10->mutex);
>> @@ -1452,9 +1536,15 @@ static int ov08d10_probe(struct i2c_client *client)
>>   	v4l2_ctrl_handler_free(ov08d10->sd.ctrl_handler);
>>   	mutex_destroy(&ov08d10->mutex);
>>   
>> +probe_error_power_off:
>> +	ov08d10_power_off(ov08d10->dev);
>> +
>>   	return ret;
>>   }
>>   
>> +static DEFINE_RUNTIME_DEV_PM_OPS(ov08d10_pm_ops,
>> +				 ov08d10_power_off, ov08d10_power_on, NULL);
>> +
>>   #ifdef CONFIG_ACPI
>>   static const struct acpi_device_id ov08d10_acpi_ids[] = {
>>   	{ "OVTI08D1" },
>> @@ -1473,6 +1563,7 @@ MODULE_DEVICE_TABLE(of, ov08d10_of_match);
>>   static struct i2c_driver ov08d10_i2c_driver = {
>>   	.driver = {
>>   		.name = "ov08d10",
>> +		.pm = pm_ptr(&ov08d10_pm_ops),
>>   		.acpi_match_table = ACPI_PTR(ov08d10_acpi_ids),
>>   		.of_match_table = ov08d10_of_match,
>>   	},
>>
> 


