Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5515A6960A6
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 11:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbjBNKZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 05:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjBNKZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 05:25:28 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2121.outbound.protection.outlook.com [40.107.13.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F3323643
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 02:25:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3F8yQDVdMW9mtvH9ziAbW7CTCKOGj+W1sCSrKwQbk8DW4tY6F1dfKG86LAI3CNzDlEJhp6N4mqkTCBv9N3jRjznOW/I3he0kaEzepkTUcAQrsIn6TZuL94eceOCIxtDlRIOgGHVYKZo+FXn/pl7XC7E96FeciforlGHIh9Bc71mfY/4L5Blgbdaxy+aemAzIdj1XoTqMqFkwV32YR/LLyHpr0aaIs6LqlMOSQN0GsbESrLRQw5yQL5KcVj6Mp5aQSqxXjZzexGdNNh4/UAqMLIyZqXIRhbh+xPQaz8Kwq0asOdxCUPKf6ZV934nBgFv7cOMh2sw+cr/VBHfYPSzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH90x0g+mqhr6vJuvXMRRmVvmLQ8HyZ3JI6H5MyH3tQ=;
 b=VDcHss+T+lfnNgzp4scUN+ERL2zFEigJs7bhSdteKZ4NySvmE2WR1cjWTit19sAYcu3O+ZHgqF37fOFFX0eW6HUSOV+SDKVJ5uDxGkJs1LhMrZ/WfVX1qk1bpb5gCpM4v0t4i2aNRS+ijn0cAhDJa9ixP6ETEkwNrLZyQpDlEpg54M3zWyTEHGkoNS7HPYSKQyWRMz8xDLrrI4EfW7TztpgEjbDuRaUsldSPnnQlPUpTDY2m0qZ1mWn2qtUXGkdET7y2gi6jHdNPj4M4+TsL6nrKe41+K5NcvDnQ3XkKDqGs5PyeYwbjm0BgB3nmV+nxHVtr7M9VZgsl0Jsq5sM1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH90x0g+mqhr6vJuvXMRRmVvmLQ8HyZ3JI6H5MyH3tQ=;
 b=IkZCDAhisw7dLPpehkJDBzkPOrikvRhJaRq8+ZVZOfISs7xLZWMxxs2I8XvgTXhVZntCjTsIoSoqrpwMbSrhQMJ7yVbAxIgilKQmojGFJzx13NulqGsUQZ+QwKW1+nUq0S2LJVAobF4H1L55rPmeQJKbQP/JvIw+IxeKDr6GaZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB7610.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 10:25:24 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 10:25:24 +0000
Message-ID: <858be7fd-18b2-a4a1-341f-06920e437ce5@kontron.de>
Date:   Tue, 14 Feb 2023 11:25:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <20230209221634.35239-1-sakari.ailus@linux.intel.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230209221634.35239-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 574d3ce0-ce34-41f8-3de0-08db0e75c883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fYVGQSuL5lTib37NnrjbEZUYt8PHk49p+sIKS98kmElBgvZOSiQ1ZOK/eppCFz6DAUhHfaONun2j+Mh++n8rzFvteoPHKXnZ79MR0hpnX23rL80F75VZS/xs5NwuVE9qxsQ1wkkBxynpfJswdbc07MT3Waum12RFqEqadGEcgDVSwG3tHD19bISW8jjzcsMbV8Ij3ef2AvoKCtbOz91nbvNxRr4qIMdrdmSlOOe7Q4vkRW1MJkTW088v7HcvypX/kIYKZRLf/kGfvR63sSND7P3/yrdTiiBPULyrdoxI/JWfKR6Gz9bpJpD9ipt6YXuC14JW+EbGarWVL/gQX/iO7DyKT0bNimApZMlHiOf14QRNarroIVZiU48jbgS4oz7G2OP/lDpREcckYEossB+nH9PITBsHMa2u1vxnsEI4of4DwabG2Wos6qNpwU1B3Y5g2OQPtscqlGnrvG5MKT7+h1Bd7E1CcM3o2m0gM8ZrAI6uBj0rXVpbVd/9sgtYxa9H8J0jC5jqtlgBWJZEq14ifVYlYp10D9kE+7EKl3axKwpX7TeQUaQeFlzcMXxoYZkmliOJuOvDaBUKQG3qFzYMUEmGzHAF5KXRdvwNgv2B7ZmZujhtPUNdWmjelU7MRWHGGHEBbQ6wm1jbDKsMz0PaZ38jOOwSRwt8G6+hjI/TPQh+GKFNqur3yJH4YJ+ICKKUErnniiK9FJBrcnyWMThgzXoxXrNnEN136v4oB9XyaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199018)(186003)(31696002)(86362001)(36756003)(54906003)(66946007)(4326008)(8676002)(316002)(6666004)(6486002)(478600001)(2906002)(44832011)(41300700001)(8936002)(5660300002)(66476007)(38100700002)(66556008)(53546011)(6506007)(2616005)(6512007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25KN1NkcmJMN3ZwNDZqY2ZpSWVUMFZ2L0hkcUgwelpoOHZhQitON0ptUkxZ?=
 =?utf-8?B?OHg3WjFnMVJDQStrOWRVZG5FZXpZY0p2MDVQa0d2SXFqQUhLYXdJOHQzd0lT?=
 =?utf-8?B?YVNtN2U1bzVYRGJIbE5sNnBsZUg0bWlLY0E2WXZCeThPQW10Q3llcTZmT2Ft?=
 =?utf-8?B?cExCaXZ1STdraXJxZjBMM3JEOVI1bGhqWFZHcndZbEhhMmliSXd5c2FBekhC?=
 =?utf-8?B?NmRDRVJOd1pRaTVvVXlVWW1jeWZMRW1RcGh1bm1VeERlUFFkNi85eGRLZmpr?=
 =?utf-8?B?bm5FdWFsZmlmOFZNUUZGWmQwZ3hDUHBmbmowMUNGcVp2QXJyeTlKaGFHQm5l?=
 =?utf-8?B?dkI3WTMrNG1FTGZ1Z1FoMmNrbEZ1a0RiNkFXZ3V2d0xxR0d1WW9xNnhkNTFy?=
 =?utf-8?B?dng1YVVtSkFCbjdJN0RERXJNSFp0bVE3dnV5NzJvYWN4bElnclZNaE0ySlFo?=
 =?utf-8?B?eTVWUktRRTIvYUc1VFNTa0NyZzRtc25XUSs4aUVtbjd5cXRROXpEcUxIT0RL?=
 =?utf-8?B?dnRoWi8wK1JreXltK3ZGUE9leW9GakF6MUJ6N1IzTncwaGxLN2JycFJES2E3?=
 =?utf-8?B?dE5QbjNmQTVoblJXV0NEVG91Q09yWW9vcGN3QlB5enl2MmYxNnBENTE2aDhH?=
 =?utf-8?B?eTB1SFJLbVVLSVoxMTdEVDhaL3JUVktVL1RmeWZna3ViVkFTOC9lWlJvM2Jm?=
 =?utf-8?B?a2VFTnVvK1YzYTJlTSt0QWlKM2JxdUMrWjM4YS9YZkpLMHJIUzBKcjg1VWx6?=
 =?utf-8?B?SFJodmNLTkgrM3dUMDJmTE9LU1FSWEo2TFBSbEdXNmZEV1pjNDJJNnlsWkNH?=
 =?utf-8?B?YndHeXhQYis4d0l3enNmQiswTUJKcVE0YSt1dUc1amRxVWdiOFVhMXhBd25x?=
 =?utf-8?B?Nm00YnZvU3hhOVExWndHZWN5WjZ0YXYyVUZ4Z1hXblhXMGpyM1hpT0ZhVXZL?=
 =?utf-8?B?N29zcGx6VTJob0dmc255bHo5OTFZV09ZdHRFaHZha0F0enhEbXlOZy9uMUs5?=
 =?utf-8?B?Mi9XQkQvT1VZdnJSZnNOcC9RUkxWcFJwTFBBQlI3d1VRczlTeVh6NXd4amxW?=
 =?utf-8?B?TEFoVTZDMTFzQkhoazQ3a3ZySkdmQTIvWHd6MXc0Y1VncktEZ2Y2MUpudTNw?=
 =?utf-8?B?clpUM0JkaGN2RTU0NjJ2MlZSTk9HL1YrWmUrMTh1Q1VQRENiWHlHVVJaVWsz?=
 =?utf-8?B?VjhkVFg3YTY4M0E2dHZqbHR0V1dYaWNNaGxaTzgxY0MvOG9vR0RkREFDUG1S?=
 =?utf-8?B?QXRIaC9raTRydnc1SzRMSDFRQ1JsY2VzdzZlUW9oenJ4bXZxc29Hcm5RdCs2?=
 =?utf-8?B?U20rMWMwWmU3VTJ0clJ2dDFaWW9seXprcXJsOGZNVXZGQysxL3FWMkVZbUs0?=
 =?utf-8?B?aUlidVFXL2dkZ3ZlK2Q3MWo0enU4RmV3MDdxTGpZai92d0dvZzZFYmpaSEpZ?=
 =?utf-8?B?ajBzSXRwTFpSbGtRZisrOVJzbGsrYkZHT3diR3IzMytGNng1ZU5vNmZzV3di?=
 =?utf-8?B?V3FJN1ZtM0RPUmNTWlFmdlJEQjBYcFVlOTlNME5TajkyVVIrYThmK0d6VWQw?=
 =?utf-8?B?REN1WHRtQkdNVXhOeU1iR1pCWWhTM3ZLZzBLRXlaZmNWY1E4WGlhcEhCWjNn?=
 =?utf-8?B?MVp5TjBzUGFBUUlGTnlzc1VnWFF0Ynl3ZzNTRVNEc0tuZXpQRHdXbzJ5cTY1?=
 =?utf-8?B?djlPRGZZV2xybkljTG1xa2ZabU56d203alhQbWhkV0d6R2RuRlU3YStsTVZH?=
 =?utf-8?B?Slh1TnlUWmJEMW02TWF4TEV2ZWozVXJOSjFPNURoOUU5cU9YYVVicjRDNlpL?=
 =?utf-8?B?VGRoaUxlVFQ3QW03dHMrUktxSEhqc2dESjM5bW5CWWZzdXNCMk16OG9ma3M0?=
 =?utf-8?B?TXVoZkRiOXdrcENxZHFTdDQvVlZRNGxIY0dFcDhBTzhqZ0RoVk95MnY4S0o0?=
 =?utf-8?B?Z3NaQks3UVBNYnZkRWxaK1hrOFAzN3RPblI5aWIxNnpsT0FrMzA5OW5WdmNI?=
 =?utf-8?B?a2wxMG9qWkFVQm1LYmtxVzNqYzJ0NjRuWHFVdFFMcDJ2bHpCVHhSbU5OckpU?=
 =?utf-8?B?NE1MU043aUJWYXluU1JYQTdnR2FVZlNBb3crbUhFeGpINURscnBsNk5IeDhW?=
 =?utf-8?B?YUNqWGk5ek5ORm1SOWhyRk9FbXVoa3pxUis0ZEdzTmJGaXpKZXlISWpXOUhZ?=
 =?utf-8?Q?1grRZXnHuHr72XNuUw230X4Xuu74mZncK0yT5drS8wyr?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 574d3ce0-ce34-41f8-3de0-08db0e75c883
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 10:25:24.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Nda/2IZ0W4U6wR16BNqCdMwpmI6E4Wh54oreCbDZQfx1UvVVE4Xu39tthlC5Jei1q/GIFg5QgfDya8m0SMGe46cCZmve+gl3MwfF4o8vLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7610
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 09.02.23 23:16, Sakari Ailus wrote:
> Just add some debug prints for V4L2 async sub-device matching process. These
> might come useful in figuring out why things don't work as expected.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Frieder,
> 
> Can you try this? It prints what is being matched with what. Perhaps this
> could be merged in a bit more refined form if it proves useful.
> 
> Not tested in any way.
> 

Thanks for the patch!

I fixed a few issues (see below) and gave this patch a try. Though in my
case it doesn't seem to help much as the problem is somewhere before the
matching actually happens. The only output from this patch I get is:

[    1.536479] imx219 1-0010: trying to complete
[    1.540856] imx219 1-0010: V4L2 device not available

Thanks
Frieder

>  drivers/media/v4l2-core/v4l2-async.c | 41 ++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 2f1b718a9189..6c13a9488415 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -86,13 +86,18 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	bool sd_fwnode_is_ep;
>  	struct device *dev;
>  
> +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> +		asd->match.fwnode);
> +
>  	/*
>  	 * Both the subdev and the async subdev can provide either an endpoint
>  	 * fwnode or a device fwnode. Start with the simple case of direct
>  	 * fwnode matching.
>  	 */
> -	if (sd_fwnode == asd->match.fwnode)
> +	if (sd_fwnode == asd->match.fwnode) {
> +		dev_dbg(sd->dev, "true\n");
>  		return true;
> +	}
>  
>  	/*
>  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> @@ -105,8 +110,12 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
>  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
>  
> -	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> +	dev_dbg(sd->dev, "async fwnode match %pfw vs. %pfw\n", sd_fwnode,
> +		asd->match.fwnode);
> +	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
> +		dev_dbg(sd->dev, "unmatching node types (false)\n");
>  		return false;
> +	}
>  
>  	/*
>  	 * The sd and asd fwnodes are of different types. Get the device fwnode
> @@ -120,10 +129,15 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  		other_fwnode = sd_fwnode;
>  	}
>  
> +	dev_dbg(sd->dev, "async fwnode (compat) match %pfw vs. %pfw\n",
> +		dev_fwnode, other_fwnode);
> +
>  	fwnode_handle_put(dev_fwnode);
>  
> -	if (dev_fwnode != other_fwnode)
> +	if (dev_fwnode != other_fwnode) {
> +		dev_dbg(sd->dev, "false\n");
>  		return false;
> +	}
>  
>  	/*
>  	 * We have a heterogeneous match. Retrieve the struct device of the side
> @@ -143,6 +157,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  			   dev->driver->name);
>  	}
>  
> +	dev_dbg(sd->dev, "true\n");
> +
>  	return true;
>  }
>  
> @@ -255,7 +271,10 @@ v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
>  			v4l2_async_find_subdev_notifier(sd);
>  
>  		if (subdev_notifier &&
> -		    !v4l2_async_nf_can_complete(subdev_notifier))
> +		    !v4l2_async_nf_can_complete(subdev_notifier)) {
> +			if (subdev_notifier->sd)
> +				deb_dbg(subdev_notifier->sd->dev,

dev_dbg()

> +					"cannot complete\n");
>  			return false;

missing }

>  	}
>  
> @@ -273,18 +292,27 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
>  	if (!list_empty(&notifier->waiting))
>  		return 0;
>  
> +	if (notifier->sd)
> +		deb_dbg(notifier->sd->dev, "trying to complete\n");

dev_dbg()

> +
>  	/* Check the entire notifier tree; find the root notifier first. */
>  	while (notifier->parent)
>  		notifier = notifier->parent;
>  
>  	/* This is root if it has v4l2_dev. */
> -	if (!notifier->v4l2_dev)
> +	if (!notifier->v4l2_dev) {
> +		if (notifier->sd)
> +			deb_dbg(notifier->sd->dev,

dev_dbg()

> +				"V4L2 device not available\n");
>  		return 0;
> +	}
>  
>  	/* Is everything ready? */
>  	if (!v4l2_async_nf_can_complete(notifier))
>  		return 0;
>  
> +	deb_dbg(notifier->sd->dev, "complete\n");

missing guard "if (notifier->sd)"
dev_dbg()

> +
>  	return v4l2_async_nf_call_complete(notifier);
>  }
>  
> @@ -386,6 +414,9 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
>  			continue;
>  
>  		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
> +		deb_dbg(sd->dev, "bound to %s's notifier (ret %d)\n",

dev_dbg()

> +			notifier->sd ? dev_name(notifier->sd->dev) : "no-dev",
> +			ret);
>  		if (ret < 0)
>  			return ret;
>  
