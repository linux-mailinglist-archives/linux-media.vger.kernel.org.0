Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DB233F7CE
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 19:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhCQSE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 14:04:56 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com ([40.107.7.135]:49499
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232918AbhCQSEd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 14:04:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L55sRXHrqE0gfbksYSLKYufzeaPD1GgkJsxyI8JX9cMSR5kSHKX4mi1cmrJYyMhtXMQh3xXHc3crvPXk32tzaBcwl0hV0j91ndGl4lttOaczJGNG7BKCr4zeFAN29bNw8mpsNLACMMfy8GGXoa+T1YbiU3uR9v/4ETht0xojdMMBWPetxwhZfTxelmOGAIew5TiY0DqT6sUDqME4aIHprrVEiGiueIXhUjZwV4R/DYDePPqt03tKbfVozd8n6mRii86i1JIF4fklv9oU9oj7/2GbjVvJ8yD1R3k+ARnfb95pQ67RYhp2yN7Fr3rqwof0sxGRmwZnAJfn3eU4PQoZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmTc63FzhYksu6fR/QCSq44AWDo5QXtl9JZghVb46dY=;
 b=CIbAdYMcf1ytxhMnYdNej8EsgiB9fPRINANobbP8anJvyL/ufvjJuVHzDiWbBHmsMTdxVXUQilK5t23F8nG0epoK7HUD7Cfe3C8kY6Hf2KrcT/QDSO5dY4JDAvm78bcBt2C6yBcG8mf5eqfKonOvqUMIGw1vTzP7aRo879J/aiET2/+3hQHxl8XPh7EebCmiDZTsJKqGOqTsXEqdHNpfDIGPnapv7J+h/8nnIrU0W/m+/DGA9CnRkZw3XQsGVgw2Q1Ymbj4jJsfcAls65YUlxdihSKqbHKuWlZYI2AXihuafpOFYnqTFrx7eTtFsmr1ZHP+5wwXjMwUz+ZVpxMZyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmTc63FzhYksu6fR/QCSq44AWDo5QXtl9JZghVb46dY=;
 b=LmFLw4521x7sVG46c4AG2cIusIajTG/+t4PneI8qd4t/L/AQJSW8P/jyrzwVs5vORhDTq5GfMEtgnyTHNhRuBFWknB0m0S8CwGcaIRAKYhUW5f1UdXZmXtJ2dHq37XD8gMHHCevYU6Y5vPQ+4leCL91HNtPKi9PpzjUiDcruC1M=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2273.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 18:04:21 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 18:04:21 +0000
Subject: Re: [PATCH v2 00/77] media: imx: Miscellaneous fixes and cleanups for
 i.MX7
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <268621a5-03ab-4cd9-d95a-bf5b6a4b4f7b@kontron.de>
Date:   Wed, 17 Mar 2021 19:04:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [89.247.32.67]
X-ClientProxiedBy: AM6PR0202CA0069.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::46) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.247.32.67) by AM6PR0202CA0069.eurprd02.prod.outlook.com (2603:10a6:20b:3a::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 18:04:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f20a2c6-1eed-49b4-5bba-08d8e96f16f7
X-MS-TrafficTypeDiagnostic: AM0PR10MB2273:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2273F80EBAE58A4DA92B3FD4E96A9@AM0PR10MB2273.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +EpnsdcjgEW7UR3Q6JLv0Jk814I5fPjyVtw13U1mon1YDFf764UfeJZgorfC8lo7NykzCG8OwXr2BGCNTk2jOhZ5OEFTD36dmi3whzoPNP4u0MZHYUnUaKDkdUY7RMRfAIMG59gXZKi5z3YavtZsFjRmnPv5I8On719t2SB6fhGlGtQkjsOrc51R2rOjPA3ulKZuezV3byzy3s+gbX6SE33IupU0HeSKu6ro3G6mZKW6SWc+1oKbd+lAlhY0jInldEUBMrdv1ZLXcZU1daXrEi1oeO44U+cqYOOexXpmh2+iDeRfx28R4MrrCqGYNQgHzpUX406cIY1jJkzrxoCgfIQgOKCAc+AeF+3sDLpPPo2XAEhImJfjwuiQ9pq0FVwOKCFeTm0HzYH/DUmyCdD2EZXqlRLR1nRB6ZclcTwrScH4Dt5Hd9ewzZ3j7FpdBrt7IVaz7WEkrkgRiG+2+WcAvS78XN1Pl6hj0z1O1LGaOLhDMfFbxzLzgsHLIVi6jNZQ31lZCYmfflUfSJNT9WRTvbkSKjSE+FHgOsK0d4T1S4KJ7akLrw3e3fgVnrCtMq9kbenWBwhV/3PNSQGjTdxNxH/5SskfMAddGksbYsu2msA+dFv6thhNHqXZsE75OOfn1eDkikb85Efueoxi3+t2Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(39850400004)(396003)(4326008)(16526019)(8936002)(6486002)(53546011)(2616005)(956004)(66556008)(2906002)(54906003)(16576012)(26005)(86362001)(186003)(31686004)(316002)(8676002)(52116002)(478600001)(44832011)(5660300002)(66476007)(66946007)(83380400001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVJURkdmV0RMNnNJMG41cG9wdGZQRXJPdC81SXYxdlp6bi9INFFSbWltdmd1?=
 =?utf-8?B?Qmx3ZFR1ektqdVZ6Qkt4djcralU5R0lXUEo4dlFYMU0xbFo2bEtoSXlmYksr?=
 =?utf-8?B?OGhvbjBWWHlBalY3QW5tRlNja2ZwYkFTNnUrcmxNSlhIKzMwNThJN0dNQmN4?=
 =?utf-8?B?UzhZcG1KYVNDeTQ0VTlVeWhObzRUVHlUZDRKa2x2NW1BRjJXU0ljR0Z3NnpW?=
 =?utf-8?B?UnlRNEt0UCtuSTZNNU03R0liZnFseDh2Y3E1K09RSnMvS2ZtWFliWXhzTFdU?=
 =?utf-8?B?VEFqSWJFRitOa1NvNTFWZzBwNnQ5M0VtR28wMmE5cElrMzVBelQwenlPd2Ra?=
 =?utf-8?B?V2dpTUQ1RkNkcUZad2NrUGFOWjhXNCtKTUhrdUxxS0hFS01aNG5kUExKWkw3?=
 =?utf-8?B?d2hLQWRnenVGTEl2UEpCaGNvNVFBWFdVU1BHU2Uzb1RjeStUMjN6Y015WW91?=
 =?utf-8?B?TjNvMThhelNkZjdXYWZMd1o2UUJEQWZZK1Byd1VGY3E0aUZ3V3Yxc2lnemtp?=
 =?utf-8?B?M1h5UjVKMndqU09wWUQvR2tPczhkaVljTk9uYXBDNk9Bckc5ME5vS1hLQ0tS?=
 =?utf-8?B?UGNrWk5GZ0xWcHNYbG1HbGFCcTBRbmR0dkwrazBEZXVxRHFIRXZ5b0JQTDZM?=
 =?utf-8?B?cGxWRnV5MUgwd1R4ckZXbTVQcGhiOGwydXFERFhHbGxsd2Y0NHljTG1RN0lV?=
 =?utf-8?B?UE9HWFhVRU9sUUk4a09OL1RZb28ybytnTERKd0g0Smg2VFpWbEVIaWZ6azNw?=
 =?utf-8?B?Ty9QV0ZyZmRtd2ppZ0FYRVhDa1NQM3lmZEpXd2VBZkFpMkF2MmRaa1BpcUhR?=
 =?utf-8?B?eXAwaEZQUkljWHZDcEltdDZyenh3Wko4VDVKU1FEdHduVHJqd0F4ZWpMNEtn?=
 =?utf-8?B?TWh1NmxxUS9HRno2OS9leXNCSld6L1l1ckF2MUtRK1I3aUY3VDZjTVFsVW1F?=
 =?utf-8?B?VUhKSnBBRFBKRVBnUG1jQWN2ZjdadGYvSllNQ1FpWXIxWnY0OGU5dG9VUmlo?=
 =?utf-8?B?d0t5NkZDRDhCQTVhL2xwMkVjdDY0MkZ6WHJ0dUs2by9CbE9BOWFoY3I1M09W?=
 =?utf-8?B?YklEdkcrdHhJbjU3ck55ZlZBTVUyNXp2S0VZcGdwUWVVZU9XVGxiejc1VlQ2?=
 =?utf-8?B?M3hmc2JqUU42WmE0REZsTTg0dThsZENBeVNaR2V0ZEl1N3N0bkpqSmxtcHBv?=
 =?utf-8?B?elQ0MmYzb3FVaDlUa09nNDRDbzI1b09vWDJOSjBGNG5DNzAxYjYwODVtOGNw?=
 =?utf-8?B?UmtTTmVFU0QzM0xSVGQyNGR3UWoxYXRqd0JmWVBqTWRHYU0yVDJjRFo1K3Zy?=
 =?utf-8?B?TmFHVUV0QzdhZlpmQS9BMENkV3JPK3ByeWI1dFFHVlpUdlhZejJMNkVHYmVZ?=
 =?utf-8?B?Ulk3ZHdoelRlTEhvNUFoRVFxQlhVMHFtYkk4TXROR3oyQXBMUmhIbmJITHRG?=
 =?utf-8?B?eGZTVWQxZkZGaTBNZHRCS3IrM25aKzB5aWRXb0llMGRLazRFbGJ4bnEyUkVR?=
 =?utf-8?B?UlN1cnJSL0JQcDE4SEV1eUs5NEk4Uk1SSU03WGQ3N0dsZzZweFRXMU1sS21P?=
 =?utf-8?B?WU1tUGd5SERDWThpZ0ZmSllzWG9kVy9iMys5bWoyK2t5UWljS2RsY3V0Sjhx?=
 =?utf-8?B?S1Ird05IL3Y4Y3J3dDBzNnVMdnRwc2lxNkVXUDE4UUJITzRqSFhQMlZDaUFs?=
 =?utf-8?B?NktLYzMzamhvUGlBSFV4akVLbDFEN2M3NVB1b0pIbXVubFJ6Q0M5SlRKclNE?=
 =?utf-8?Q?uVcqCM5d+z6zUI/nAuPGojfRM1Kn/OxGVgGOHXO?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f20a2c6-1eed-49b4-5bba-08d8e96f16f7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 18:04:21.1245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvdm3A6FmWporjHcz8yhfu0Y3n70WqshU5g4IXel4Jsi/yYlp9qStP9xm6qbQmulnJGPQt0KzPrBdqLFdD16yvyy/kXrLwq0pBrDoM3Nijs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2273
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 15.02.21 05:26, Laurent Pinchart wrote:
> Hello,
> 
> This large patch series is a collection of miscellaneous fixes, cleanups
> and enhancements for the i.MX7 camera support. Most notably, it
> implements support for the Media Controller API in the driver.
> 
> Compared to v1, review comments have been taken into account, and the
> patches have been rebased on top of the DT bindings and latest imx
> changes as present in the linux-media tree. Patches 38/77, 39/77, 60/77
> and 61/77 are new. For additional information, please see individual
> patches.
> 
> I have successfully tested the code on an i.MX6ULL board (with an
> MT9M114 sensor), an I.MX7D board (with an IMX296 sensor), and an i.MX8MM
> board (with an OV5640 sensor, and additional patches for i.MX8MM
> support).

First of all, thanks for the great work!

I'm currently trying to get a setup with CSI + MIPI + ADV7280 working on 
an i.MX8MM system. Would you mind sharing the additional patches I need 
for this?

I guess you are referring to patches for the MIPI CSIS PHY and the 
devicetree. Anything else, that I'm missing?

Thanks
Frieder
