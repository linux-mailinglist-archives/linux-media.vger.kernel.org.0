Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0147D3955B4
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 09:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhEaHGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 03:06:10 -0400
Received: from mail-vi1eur05on2111.outbound.protection.outlook.com ([40.107.21.111]:28000
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230104AbhEaHGJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 03:06:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7FeSxBRRzAl1G4VAyAAdIaDhyr9nFxVbQcRYViDbJHXatV18sE7FSN4RQfF6mTOjdZStcA40kog37tcPCnTHQgnSNi/Q4/pFl86QAl3Ff3mNcDJCuOf1Bj9aaJ6St/Fzm94SF4iSKQYtSwYxIHagNwJ8mfycBOp6H9iMeGid6UXopGelFRqPGq2OEEsU0SHlLDDFt2Uj/FWe1d6p4OWn7uVVVF3yAHL3Gz0KXQSQn+JNt7ivM+XHaHPFUAENO6yJ2CzQlsI3Rhey/1iDqXZbAuBc9/lS0pzKlTSiWzrKZKHrvCA0daq4gSipqpRJrX43+lAWeoBhE6pWHu4Y4Zlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uU4grONZ3fiN02Tm9cmFv80sfn6Wvoq/fj2kb/2Qxc=;
 b=aSPvK5laBGJzTWxXf5WBwTj8fx4jz6w7+roE+kydGmxkJA5qHgPQNL/UQ4Tf1OIzoakjW6f2XZU0gOMqsdbgboz46K8ZdyRF3fo+D9tqC+6pla6nO5qeJN9JBNR+dQPn0M3p7iTJqKPSw0SRHUsyns7G+mMtelQvOqN+RBSBCRg5v3ewmXDJEa4kGlS4vQTea0G/FpCJE7c/xuWvk0Bh+z3zzxIQLgGn+iyBRVALQrCrj+0ij6nkEb3lWuNI3pPFxb/47Wn0bTw3vUXqCqCOClIcIt5WpFsJWNG1NbZpuugq4lXD2JtH63+ltygQZA7u5eB8ajXSK7VkKGfll079nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uU4grONZ3fiN02Tm9cmFv80sfn6Wvoq/fj2kb/2Qxc=;
 b=ETXOATfHM7l6rlneog3SiRq92M4Lv29iFJHGXXSoU1ulorLassrvr/8F/DoXcZ9jmMKB0ms2PKNeZ3bksFviFmAPj3WS4dIDxwrT5nC3m090UOJpA5l58COACbLVjMnvwqqB3ZeKkWO0yjavX3Bfd6lCZMvocIp1xdJ1A5UAzvg=
Authentication-Results: ragnatech.se; dkim=none (message not signed)
 header.d=none;ragnatech.se; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4644.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Mon, 31 May
 2021 07:04:28 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 07:04:28 +0000
Subject: Re: [PATCH 3/3] media: i2c: adv7180: Print the chip ID on probe
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        niklas.soderlund@ragnatech.se
References: <20210530204410.676831-1-festevam@gmail.com>
 <20210530204410.676831-3-festevam@gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <ce3c7344-2811-7ed3-90d4-066e397f6f0c@kontron.de>
Date:   Mon, 31 May 2021 09:04:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210530204410.676831-3-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [89.247.35.100]
X-ClientProxiedBy: AM0PR03CA0091.eurprd03.prod.outlook.com
 (2603:10a6:208:69::32) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.32] (89.247.35.100) by AM0PR03CA0091.eurprd03.prod.outlook.com (2603:10a6:208:69::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 07:04:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d087e23-bd37-48e6-324e-08d92402549c
X-MS-TrafficTypeDiagnostic: AM8PR10MB4644:
X-Microsoft-Antispam-PRVS: <AM8PR10MB4644B173759CC273D560F641E93F9@AM8PR10MB4644.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 855KCmr41Qkhl0tDO3UVbUxta15cgvgZIBrweexnFrbLb+rC8h4cQmE3ufgfiM/bl3EZnSp4ysL+7w0msus8HKaP9RY2HvDsIgWxMrOZljOX7run+pDOjqM0pz+dnxJshbFUyR7azaSDoxDk2nzTwxg43Qnzcx3Teu0LerOAPw/LJmUoYnK/BPzwuqQuZoQUzbIfdPS9ES//gaTHLvaPkS5yy4IFqJRbQzp2AWEaxn3h7dmzUplc7CW1C+ERhQXYpzHCm+7wsLACxczbc22LvGTSFFZ7OiSd0KWpTIAJKLgf+L/VWM8JV3lYLcZ3D+P25RMkng8OeScuYyp5DztS03ItDssrxL1tzK/SEUzbQLbE2g4H2mAWvqahVW9hY+eTEPisd8K68AlIezzToh4fsUFnjK4qm++6TqcP5A5aFf6zbZwwI7G8r74DhFJIofuaR7/LYOJb0q+6OEJq3J7vZOL9Jzp2XnXxckPrQfMkkaLqqFPeQNPcbSnSnJLFOSdIPU/Nsva8IrObEoqfIMy3IYAj7ukH4V5cP8PaZxrSDWj9n5ILw3PpX8VN5NKpAyB8wovTwUZwLy+4G/1hYuohLJjpSAGeBYcZ5AYQiOjiszAZUBmmM06SyTonZR4B8Qu5bkWv6/EdQbGHUl7iwtXY3HLrCGYrIWTBON3qzuWdQ4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(39850400004)(376002)(38100700002)(956004)(6486002)(31686004)(31696002)(66946007)(44832011)(16576012)(8936002)(2616005)(8676002)(478600001)(316002)(5660300002)(4326008)(53546011)(26005)(36756003)(2906002)(86362001)(186003)(66556008)(16526019)(83380400001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1c5VFdkamtxVmpsSHpvYkNack10ODdsN0lINm93ZzF3cXhXdWRNOENCMU4z?=
 =?utf-8?B?M3pnVTVBVkwvSGR1LzI4ZkNOY0xuczJKazlWNUpMb1JCOG1rakc0bEk2SVBG?=
 =?utf-8?B?NHN1T2xaZ0RSQy9zSU5TWHF5bDJBMTUrc3BqZkJIaWlLRG1ycUw4UWpxaEN0?=
 =?utf-8?B?emxReHpuYTg1cVFydTV1SzlLaVVmSUZ2VDhwTFVhVG5zZ043eEpFaDBEcjNr?=
 =?utf-8?B?Sis3YzVKTG5CMlp0WVdnQ0tIWkhvRlZWdGc1ZlJFaUpaZ1c4eDl4dXpXRmlZ?=
 =?utf-8?B?Zll1UTlXRUxNcXlnVHNsZVRKQkdidC9kU3N3YWsyRE9zWUtKRkJxc2Y5YjlY?=
 =?utf-8?B?Q0VtV1FXUW9mVHNxVFRFYWMyRU1FYkxtOXNMSVdvdlQyeDhwL0MwK0l2WlE2?=
 =?utf-8?B?UGl4Vno0TGFtdkpNVlR2bjdyZUxvY09DVFZ2UmdJd2JQRGZXUmFCS3l4SndW?=
 =?utf-8?B?UVpOcVBqd01UZGQ3U3IrUXVETWh2amlsUjV0M0JTSzhQRTFSMXByWG5ydmVz?=
 =?utf-8?B?OHdQeTJaRU9BNTgwTzh6SGxzQXVJWElSdUUyc2xldFU3VWJIM0RWSFJaSlU3?=
 =?utf-8?B?QkVjRzhxUXg5ZkN2VFVGcUFCRDRUanRScHZJWmo1d1RPSEE0VVJMQ3RKOGcz?=
 =?utf-8?B?ZndWL2JVS0l4dDAxZlA5djMxSUlBNGNkN0djL3hSSkF6STU0V0h0QUxoK255?=
 =?utf-8?B?T3lQZm5ObTFVV3AzU0RzV1hqdlBTVEJJaEVwR3VSU04yZndVOUlEOGJ1NFBy?=
 =?utf-8?B?bllVZ2RjbWVYMXZZbGZHWCtyejhMS3BnTHJlbGZldnBKV2RPUlJNNE9ISk9V?=
 =?utf-8?B?d3puMFZHQi9pSCtodzF3STNIRkZFb1R1ZktlbFd4bC9WSEdra3BlV2dmbjZv?=
 =?utf-8?B?dGRFT01rVGY1SjBaSW9ET3lJdHdvRzdWdjhNSEhMNjNqdUJxYWRjUUJMS3Bq?=
 =?utf-8?B?WkxVVDZsY1VpYm8wampsUUQ2WVg3S2pkcmErZlc2WkpCMFh2bnhITzNQbWYv?=
 =?utf-8?B?YXZoeGZBenp3MkhQQ1lETzVtZG9LL2p2VnY1UDFUU08xc2JuZzg1TkszWnRN?=
 =?utf-8?B?R1BzS21FMzB2VlQvb1IvSWFXK1pqbWkzODBHVVVVcVNHVDNGMC9SU3dKSmNO?=
 =?utf-8?B?U3NzcS9DVmZkSUpjd2ZrSm5pRmRzdWJxcFF1NURkVFFITlM1Q0xGdmZiUnFw?=
 =?utf-8?B?SUt0TU5IMEI2QlZsV2dSMWxrQTlVTmJqM0hzVGRzaWZIanhFMGl5YkptRWxY?=
 =?utf-8?B?Q1JzbVRKbEl3Y2IyM3BSV2V2Mk9qajJpY09aY0pnSWVURFNQNVJMMnhQbGFy?=
 =?utf-8?B?TU9hMU9NMW5Ia29sQTJnWCs5bmtkaHRzRlEzYjBlVlQyeXVGRVczSGVqemVr?=
 =?utf-8?B?ZGVwelZIei9sN3ZTcU9xeXk4NWhuZytrL3I2bkxqSytJZ01SQjBkZUVxRmM4?=
 =?utf-8?B?RUIzc2g4cFRnV1ZvYXQ0K1ZBNEFZZnB3eVcxUWZDWGNMNWMzZE9LUnlDZEM4?=
 =?utf-8?B?RElJUDM0Vk9PTmJJZDZvZWhPK1h4RG9EMGlVUEVyUDU3UkEva0k3bnFxcWRF?=
 =?utf-8?B?bjQ2NlBIYnkzQXRaOVNnYXp1VG1BMGt2SWs1TERzZHQ4ZWpwbkRkbUhGRjZu?=
 =?utf-8?B?SEFSTFVqSVVlanAvU3hZVUttenQ2THBzVGk5ZGlRL2xsNFppVkRlN2VnYTBF?=
 =?utf-8?B?WTZhUEdrNzFXOXF5UC80WVZaTm1LY1BSbEl4dHp6TVh2WkdiREorYU5BQ3Y2?=
 =?utf-8?Q?kNcpgZzQ8aRvzQaljW53pYupOu+yOKFG8tUNCjU?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d087e23-bd37-48e6-324e-08d92402549c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 07:04:27.9092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwhxLqQyZG/RhghoXzss7DN21VdpDC2onfz6/kxXpt6xYcDnN83D3zLL0W3KD9FBN1x6zgUmJIu6p9319ICRojmvDKpYtXma/0PjlRLD1zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4644
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30.05.21 22:44, Fabio Estevam wrote:
> Improve the probe message by printing the chip ID version.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>  drivers/media/i2c/adv7180.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 2811f2c337fa..e5ef99f0460c 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -1404,11 +1404,19 @@ static int adv7180_probe(struct i2c_client *client,
>  	if (ret)
>  		goto err_free_irq;
>  
> -	v4l_info(client, "chip found @ 0x%02x (%s)\n",
> -		 client->addr, client->adapter->name);
> +	mutex_lock(&state->mutex);
> +	ret = adv7180_read(state, ADV7180_REG_IDENT);
> +	mutex_unlock(&state->mutex);
> +	if (ret < 0)
> +		goto err_v4l2_async_unregister;
> +
> +	v4l_info(client, "chip id 0x%x found @ 0x%02x (%s)\n",
> +		 ret, client->addr, client->adapter->name);
>  
>  	return 0;
>  
> +err_v4l2_async_unregister:
> +	v4l2_async_unregister_subdev(sd);
>  err_free_irq:
>  	if (state->irq > 0)
>  		free_irq(client->irq, state);
> 
