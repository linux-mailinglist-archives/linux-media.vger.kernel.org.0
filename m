Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035D136C713
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbhD0NeQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:34:16 -0400
Received: from mail-db8eur05on2132.outbound.protection.outlook.com ([40.107.20.132]:13409
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235875AbhD0NeM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:34:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAtPjwxULbSnxbXuttHLL3XrlTAtU8FzrJP796yHr5Z435Dr8PCX1ur58KSP5Ko32zY2QJZqfhonceqk8oKB8vnGgrMJ6cK3vGWPucAm/SmONcehbnH+Hnq1MzSKt8hIQmrXwRXssfocyUX4DN6FcVHe96fxu56mIIK8h1B62msqb0b32iEtMVNsTpR49FFtpJVJVyxEbujg0twalAW4ZTGii1j6uyCFSLRhqEL72n9peY48yo2lLcm2wjUMDd3QVn8DXNUL+v0pdSdivYCXuwPNvPCfL3n68BG+4A5DfQX5bE4DG7iGkoug9EqILVAzGC50zO7fS+DJY4oBbwc66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gToJAjYh1oVicGZ6G2f0a/IACBq1s74qRoiKFryIY6A=;
 b=Ot220txastG39Ind6mbqWHbuDSZ/ASrRrlfQFcFFU8LDLqwVi1rZzRAnCDaI2+h15DXyqcNApo7/8loB6uOG9hvChdpVOnK/ChpOqnsWKM5Go158QC6H9+1um6sIJROE2Hob2bOMgfZXFq+fue7l5ZsoEgL8Mp9RiCApC0WWNjOkWLunbFROnpZV7ow662QFetUQyKQinFIWKjcKlXe9fBN5Dhea0fJ8hozEyGW8pyhrEzXCP0zwQR3LRjLAvug9vQmzFoGNbio2fCu1W9O92sS2gobIRrU0EXq892yqZJ/stevBOQXOAAC/5zUD7MSTCbMqBkXaaVxMcezoZlehLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gToJAjYh1oVicGZ6G2f0a/IACBq1s74qRoiKFryIY6A=;
 b=HRFs5ePyj6tQJBD6ATwMmGXRqVVF/BmZjA5eTV//RkgjE+02si9j94iP+5AM0RoGoOkWf1KnsH2M/VlZpajhc8+KqumNMurq0mvlvNACDKuBajf+PAa2oOTNqkiCg6pQb8f4U8HmGWeAaHy0n+JomppDQbSpJ/l6tPJFDKwfnvQ=
Authentication-Results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2164.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Tue, 27 Apr
 2021 13:33:26 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 13:33:26 +0000
Subject: Re: adv7280: Scrolling images on imx6
To:     Fabio Estevam <festevam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAOMZO5BEre9=se1yAxr7QTmfV_N=GMKZeanr+jYfRNrSO551hg@mail.gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <4ea17a0c-b442-1ca2-1ae3-7a305d53273f@kontron.de>
Date:   Tue, 27 Apr 2021 15:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAOMZO5BEre9=se1yAxr7QTmfV_N=GMKZeanr+jYfRNrSO551hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [46.142.161.205]
X-ClientProxiedBy: AS8PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::15) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (46.142.161.205) by AS8PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:20b:310::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Tue, 27 Apr 2021 13:33:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1509d6c1-cba2-4db9-b041-08d90981097b
X-MS-TrafficTypeDiagnostic: AM0PR10MB2164:
X-Microsoft-Antispam-PRVS: <AM0PR10MB21648500A6E417B18E61B31BE9419@AM0PR10MB2164.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gTdiILA5+RqelLyWTE3N+SjLXMq5dqDYKXvoGbUXFHB2P9t34TRRCccBtmOoxTr6eN8+IhiujzVvpPv5nwNx0VYOENHlmriTiYi4AGo+VkeIwf6uSwQFLOHs3yg03QUh5VVHV35eEGooHZNq8gBL/n+WWquFW8vSCUDwvijLYVN1rrI95DAIRDIQw6whDNNKFFMWayn10s8WwvF8cL91h5MldkctETX6GUNaLMGDsNQrSB1L6BD3GZh5zwUnzl30yFFBbRcihnB4Xq7jrj/cRlouomZusR3LvoqtVV2Sn3fkNBpYnOUQG25VQ0ex5tpNzEvVJJiSwa82+LXxLN7IzNYMWwztSB8gIUOrkNU8hgsC6fUSXxnroU142kht+x5xtgz3gOn+lUsuSHNiwepF2WwmORh2pgDzrHpLo7mwJ+f7929Dgn5b4aMSE+FjvFLHFtLpuWvUUKsrtS+rFaIXxtHoHulvqrA1QObQtbxY+6xmhsGipjElKSOnFRLMRqf4XMZq9V+JGe2XawYj+oUsBjqzAge0HYEJeopI7FI1s/y2KSmdNltNZ3AY7rkE+LXyR+rcPMBsot97A3HG+ZCITKlOSsIOfufRvVNgF1LLaIB03FemWCJhjbdriVOarSDRlkZgoYgjXRjltSjuUv22CgbSB15jrLcbNUXuvPRYAZylYLRahTCmkEfJaE6bQdk6bgKdm474LsYXlyTWBR9eEqVxOzpdG3TUs9SHdFQL0Q+duw+EGxYPvUQAGh6ll1I/Amnf/SJ7EAB49MViiizN2jdB1XC1dRTF4HszLPVkceRF35zd79GMjrcv1gJJrpdP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(366004)(396003)(83380400001)(44832011)(966005)(31696002)(2906002)(53546011)(66476007)(4326008)(54906003)(38100700002)(31686004)(66556008)(38350700002)(45080400002)(316002)(110136005)(16576012)(478600001)(5660300002)(66946007)(26005)(52116002)(186003)(2616005)(36756003)(86362001)(8676002)(16526019)(8936002)(956004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlpLbXY0WC9lRDUwaTFVTWhKZkZSRm40L2NDVjlUbzdabU1BOHpWb1RTZ2ls?=
 =?utf-8?B?cWJzcTY0RU9lRWVML1F0eGtxc3lqM3h3OWFyZWg0RVV4bFUzMjJmL3VxeTFj?=
 =?utf-8?B?UzBUazRkWDFHYnd2TmhQZVE3UjlIRHYwb21PbzliMjM4VXR0a1B3RnR5WVZD?=
 =?utf-8?B?b2tFWkZtc0NvTHFzT1JLT2pwbDJ6cTNnM3pFYkpTZ3pLZytBSFZHVFcvaUFL?=
 =?utf-8?B?c2FLTi9lbGladWw4NDFUTmJWcHdxMmcydENqVitycGVqZ1ovZ1A5eDZQVzBH?=
 =?utf-8?B?ZzRhMWlHaldyY2ZtVmhlTUxmRkszOExFdFQ3Y2UzcXFNMHF6WWhFNmRKZFJ2?=
 =?utf-8?B?cWIvc2l4RkVaaGlnblZwRCttTi9ZK290Mm9sNmFOQ2NrNStoZDNEWVduRUU4?=
 =?utf-8?B?RXhQNEFqdTlmYUpWeU03aTZ3T3JKWm1MSnQxRkF1R0xWS2dCTVpuM0JWWG1Z?=
 =?utf-8?B?QUNkSk5wK1BQUEFCZG1PVXhvbG9mZmpLcmNiWUxhZXd1cmVqMzJRbHRaa0o2?=
 =?utf-8?B?YXoxR3kzRDV0NGpYQVN3Ukd4TU85czYrMllPQitiUXovVFEvdEp4VEQ3QnE5?=
 =?utf-8?B?aTRyWHo5K1JJSStiU25mRGlQM2dCMVFTOU9OT1I5bEM1em5zZGJML2pyWDB5?=
 =?utf-8?B?VGRMTE1BOEg2UWtoakcwSVgwQjR2dnJLVjUwVk5jTHdhV3pxNUtaUlhaUWVJ?=
 =?utf-8?B?WGRhelNVY2FCdXFicVRDNWlBejZiZ2xrNnBRcTVNUnZieWtPRG9rdm9jTDZW?=
 =?utf-8?B?VitORTFjY0hKMVRLaWtzTVlTMys4WVRkVFg5ci92cTVtRnFEc291clUvVUhp?=
 =?utf-8?B?M3p0Y0hmOFlSRGVmYTZPTFpHZ1ViU2JaNVFMdGJIRGFocDR4RURVSkcrNzRo?=
 =?utf-8?B?T1BpcVlkVXQ0ZitxM2xtSWlFWG9xZGJvZFA4M2lLZjBJRFpRSUNIcWxOWktN?=
 =?utf-8?B?Ni9wTm5IZ1FKMnlBemJLZjh6N0JqdnNQQ2dxaEN2dENENTNBcVlZSHYzYUYy?=
 =?utf-8?B?NGhobkdCanpqU1pqdTRLUitoY0ZiOW1xemVXQ2cxMXVQM2N0bnUxUXZQUEly?=
 =?utf-8?B?TE94TTFSTlYwV2hQQ01NR2VEVEI5eXR1OGlUNndUTWxXYVRCMXBrYkplazJP?=
 =?utf-8?B?WDJTRzV0VWRRWDZzeWRZZEhJSTBpVGpJVzhmY3Q5Zi94YmhVRkFQeWNyekZt?=
 =?utf-8?B?cFdCYm8yV09oZVdqeFVkQXU3VENhZ2Nwb1BOdnROazdHa0RUTVNZdmFnTjBv?=
 =?utf-8?B?cmp4cmR6SEFxb0VIZk1ZbEtHTkZmSVNlbEJDTTZ1MHAzV1RqeThrYnZ4T2xB?=
 =?utf-8?B?dVd2OUE5SzVCOXhFbUNtQjhKZ3BUdWF6VGx3ZUV3NUxaUncya2pFeHJIVnhT?=
 =?utf-8?B?NVpSR1FWQ2s1K0p4Y1RRSWdTNTRrL21ZaXppYzVjQ081ZG5ZZ2lSc3F6L29N?=
 =?utf-8?B?eHpVUU5CTFhFS0k3dFlEKzdVRy9ydmhaWjdLUXlvZ0NUNk1venZlUmRVYXFj?=
 =?utf-8?B?aTVhRTY2dmxrdHJSM3NhdG5zWDZiem1KOWZvMjdRNjZUbnRxMzdmNlNFclhB?=
 =?utf-8?B?RVIvSS9oK2ZSNmtRWndqTThNS3UxSnRlNFErVzY5bi9ONUdRQTVIN2U3ZS9p?=
 =?utf-8?B?RDNBMUNiSGhCYWw0Zm1RdkUyMTBIU2V5M283c0ZXblJlU05MZ2luQTVBay9L?=
 =?utf-8?B?ZWx4VW80UFFtd2RLcjErcW8yaUtWSGdkbG5pR2hKSlBUVWxySDBnRHdXTTl1?=
 =?utf-8?Q?EudrYQNiEaYkwua3P6fCAg9R24VXQ/Sv4lM7rTo?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1509d6c1-cba2-4db9-b041-08d90981097b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 13:33:26.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKfvmNpLDymqJgZ/WL9WbwN+8S8Ocq35v77OlUAWFwl7XXkBYiNqH3b31sNmELtBZ0TBwtYuGa54PbB9TvOQnTTArqO9+sXp5sSzU4opiOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2164
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.21 15:27, Fabio Estevam wrote:
> On Mon, Apr 26, 2021 at 1:14 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Hi Tim,
>>
>> I am back at trying to get a proper image captured by the ADV7280 on
>> an imx6dl board connected to the parallel CSI bus.
>>
>> I tried your patches against 5.4 and 5.12:
>>
>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FGateworks%2Flinux-imx6%2Fcommit%2F959fbd4&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cbe8362b204924f7c141008d909804d4a%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637551268920096235%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2ZBhpF3FRT1hpXKH95KHnoNJm42p9gHzi6h54Fokvvk%3D&amp;reserved=0
>> and
>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Flinux-media%2Fpatch%2F20190827215539.1286-1-mmichilot%40gateworks.com%2F&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cbe8362b204924f7c141008d909804d4a%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637551268920096235%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6h1N8qQ7J4w2xJujKOQp4spJDiOGLm%2FxTx0SIbBpgGs%3D&amp;reserved=0
>>
>> ,but I am still getting horizontal scrolling images after running:
> 
> The analog camera I am using produces PAL content. If I force the
> initial curr_norm to PAL like this:
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index e780969cc2f2..4ffe85ef02a0 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -1346,7 +1346,7 @@ static int adv7180_probe(struct i2c_client *client,
> 
>    state->irq = client->irq;
>    mutex_init(&state->mutex);
> - state->curr_norm = V4L2_STD_NTSC;
> + state->curr_norm = V4L2_STD_PAL;
>    if (state->chip_info->flags & ADV7180_FLAG_RESET_POWERED)
>    state->powered = true;
>    else
> 
> Then I get stable image and no more scrolling.
> 
> This patch from Steve is still needed though:
> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FGateworks%2Flinux-imx6%2Fcommit%2F959fbd4&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cbe8362b204924f7c141008d909804d4a%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637551268920096235%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=2ZBhpF3FRT1hpXKH95KHnoNJm42p9gHzi6h54Fokvvk%3D&amp;reserved=0
> 
> What would be the correct way to fix this NTSC versus PAL selection?
> 
> I tried passing the norm property like this, but it gives me an error:
> 
> # gst-launch-1.0 -v  v4l2src norm=PAL device=/dev/video2 ! kmssink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 800
> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 480
> WARNING: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Failed to set norm for device '/dev/video2'.
> Additional debug info:
> ../gst-plugins-good-1.18.2/sys/v4l2/v4l2_calls.c(779):
> gst_v4l2_set_norm (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> system error: Inappropriate ioctl for device
> 
> Appreciate any suggestions, thanks

I don't know much about the v4l/media subsystem, but in my case I was 
able to switch to PAL like this:

v4l2-ctl --device /dev/v4l-subdev2 --set-standard PAL

Though your subdev is probably a different one as I was running this on 
i.MX8MM without IPU.
