Return-Path: <linux-media+bounces-49463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED6CDC2DF
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF76D3023553
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3036833122B;
	Wed, 24 Dec 2025 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEmNOuFB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8819D074
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578351; cv=none; b=hLxwmpnmsMSVUQMSCR3XC4QaqmpIsN7Z9hABDIAhQ7X42xWNGowLdxEnsXUrMZ9xTu7CL6AhK2fuewtb3necaiH3he+fOgKbP8fD++DVBlcU7Ngp19O0hGppVEM8XKuv4oYy/gI3uTUVNJGq3kteUxMoxOU0EtmnZGDjVlfGBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578351; c=relaxed/simple;
	bh=Fh+kLFdkYnggC2mugn10XNr9W1TdPeUvyT0/irPIptY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfhHK4Oxz2Py3ygWAbGt64TOP2P/PcWXlTJ1zanbTq6+24DayBHGuO4zFS/B3YOjS1ypECut4dFdqwDh4oLoC1guA3WVImAMgFRxWKo/t2pSu2q0Z9WVkSSlBrhBG5/7VpxcORBk1hPQMafVXRdiOhC+CCoLBZnp4KnQGYuxj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEmNOuFB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9C1C4CEFB;
	Wed, 24 Dec 2025 12:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766578351;
	bh=Fh+kLFdkYnggC2mugn10XNr9W1TdPeUvyT0/irPIptY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dEmNOuFB07JFYgLnjFJVyD1kURN/7F19W/DZ7spoWBdbEgNfhaHN0N0nX3WDtbnvq
	 srChaRKGyERyBin8CWx/fziaaVGL8LoUB8vVSZLnqm/eHdNhds1jBbuAuGwBPQPR2S
	 sOW1YEoir3/g5PHi7SROKZbHOoLkBlOD6Pzw1Orlhy20arOK77ShnBvf6hEg9Yjthu
	 hN0Kd3BuiuPzL5Xqyc22kbgLzc8kDSaEEpG4yNnwzUh9F5NU6I+2YUmUZ2DRar43fL
	 vt99pkLVI8Ve5r3ZwbQb2bI+5jvZ5l9//m2xAZ5hQfb3S1k18BzmTe/RyNz6N1BkDC
	 /VoScWidYkKYA==
Message-ID: <ee136d75-16a3-4b30-a6e0-981f33494713@kernel.org>
Date: Wed, 24 Dec 2025 13:12:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-15-hansg@kernel.org>
 <20250702005323.GH17819@pendragon.ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250702005323.GH17819@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 2-Jul-25 02:53, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Sun, Jun 29, 2025 at 10:56:24PM +0200, Hans de Goede wrote:
>> With IPU# bridges, endpoints may only be created when the IPU bridge is
>> initialized. This may happen after the sensor driver's first probe().
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>>  drivers/media/i2c/mt9m114.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>> index ec5e9ce24d1c..5e759a23e6cc 100644
>> --- a/drivers/media/i2c/mt9m114.c
>> +++ b/drivers/media/i2c/mt9m114.c
>> @@ -2448,11 +2448,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
>>  	struct fwnode_handle *ep;
>>  	int ret;
>>  
>> +	/*
>> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
>> +	 * wait for this.
>> +	 */
> 
> I'm still not thrilled by this, but there's no real alternative for the
> time being. Still, as Sakari mentioned, the IPU bridge code should at
> some point be moved to the ACPI framework, so let's record here that the
> sensor driver should then be updated:
> 
> 	/*
> 	 * On ACPI systems the fwnode graph can be initialized by a bridge
> 	 * driver, which may not have probed yet. Wait for this.
> 	 *
> 	 * TODO: Return an error once bridge driver code will have moved
> 	 * to the ACPI core.
> 	 */
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I wouldn't like to see this being replicated in lots of sensor drivers
> though.

I understand. With the new __devm_v4l2_sensor_clk_get() helper we could
do something like this:

From f7b13937af5f706bce3eed87c67a8f484f049c6a Mon Sep 17 00:00:00 2001
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:04:09 +0100
Subject: [PATCH] media: v4l2-common: sensor_clk_get(): Wait for endpoint
 fwnode to show up

On ACPI systems the fwnode graph can be initialized by a bridge driver,
which may not have probed yet.

Currently all sensor drivers which are used on ACPI platforms need to wait
for this themselves.

Add a check for the endpoint fwnode being present to
the devm_v4l2_sensor_clk_get() helper, this allows sensor drivers to drop
the check for this themselves as long as they call the helper before doing
any endpoint fwnode parsing.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..b68b5567a508 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -743,11 +743,27 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 {
 	bool of_node = is_of_node(dev_fwnode(dev));
 	const char *clk_id __free(kfree) = NULL;
+	struct fwnode_handle *ep;
 	struct clk_hw *clk_hw;
 	struct clk *clk;
 	u32 rate = clk_rate;
 	int ret = 0;
 
+	/*
+	 * On ACPI systems the fwnode graph can be initialized by a bridge
+	 * driver, which may not have probed yet. The bridge driver also sets
+	 * the clock-frequency property which is used below. Wait for this.
+	 *
+	 * TODO: Return an error once bridge driver code will have moved
+	 * to the ACPI core.
+	 */
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	fwnode_handle_put(ep);
+
 	clk = devm_clk_get_optional(dev, id);
 	if (IS_ERR(clk))
 		return clk;
-- 
2.52.0

and then in e.g. the mt9m114.c code move the devm_v4l2_sensor_clk_get()
call to above mt9m114_parse_dt() and then the handling for this can be
dropped from the mt9m114.c code (and the same for other sensor drivers
with a similar check).

The downside of this is that it makes having an endpoint fwnode available
mandatory for all sensor drivers which use the devm_v4l2_sensor_clk_get()
helper, but AFAICT having an endpoint fwnode is mandatory for all sensor
drivers anyways, so this should not be an issue ?

Regards,

Hans


