Return-Path: <linux-media+bounces-56823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLaVENJMwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:35:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94961304B84
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C877320B426
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B7636C5B3;
	Tue, 24 Mar 2026 08:20:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B08315793;
	Tue, 24 Mar 2026 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340411; cv=none; b=q2kz7OswlXjIMO+Zpmt9z0R7ehfKcI6qJ8WYrhmmsWp7lvIlqxt2HYmxSZW7vfmoyPRSnzezvg9qKc04eTHG4JbNiUw7XZ5ivh+qshpDIMi5s4Iu2MRBxxgQKENirNLrlR1Vtyx90v1UhBUzM5udJCyn2yHuOEhLd3azSuZ1HLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340411; c=relaxed/simple;
	bh=6Nj7K0puMLvdvQEy4b5/QBJf7rztEGJDx6sVVYANlq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOmP+iuAuTgU4lhDe8YNUl4ypkeI9Bbkw/pnkqn2+ZomdexwukoYnv3MsLBzu7oKr5wWTZoN787i9A4N4Qg8i4tze5/YXi9DK3rIqMBnG5VSUyXssNu/nkazqrFK8gJR+PgFShVWuiyIzue8BKL32i+VN39DnCPximmPlL237PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id 3D9F110E3CAA;
	Tue, 24 Mar 2026 09:12:40 +0100 (CET)
Message-ID: <47cee08f-4500-48ee-aea6-afba5a611211@emfend.at>
Date: Tue, 24 Mar 2026 09:12:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: i2c: ov08d10: add support for reset and
 power management
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jimmy Su <jimmy.su@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
 <20260309-ov08d10-v2-8-81f8b5d99984@emfend.at>
 <abkUy5U-cwK-6_kz@kekkonen.localdomain>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <abkUy5U-cwK-6_kz@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56823-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[emfend.at];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 94961304B84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thanks for your comments.

Am 17.03.2026 um 09:46 schrieb Sakari Ailus:
> On Mon, Mar 09, 2026 at 06:07:10PM +0100, Matthias Fend wrote:
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
>> +	if (IS_ERR(ov08d10->reset))
>> +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
>> +				     "failed to get reset\n");
>> +	reset_control_assert(ov08d10->reset);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
> 
> You can declare i here.

Right. But since the variable will also be needed in other places in the 
next commit, it would have to be moved again. Therefore, in the end, 
might it be simpler to leave it where it is?

Thanks
  ~Matthias

> 
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


