Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4525F697B32
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 12:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbjBOLyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 06:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbjBOLyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 06:54:19 -0500
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2119.outbound.protection.outlook.com [40.107.104.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E553801F
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 03:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak0c+LI+dVckM2vQkzOILHyCLwuWNNRtJj6w0r8RCQ9ATUXkqHByq4YqTIvh0X7YePmLVqmg6vXfFv27EGqzmjuz0JRxr7q2VgZSBSe09cfJxx3bJWld2TyikKdLzfJIQO1thHC7A3FAiUlLYu6HOOA9MOWM1M7OsZ3DsJdevAdgbf5HlCzaOfyrmj9ZRcG3oSCTKQ5GovT23oecpZVGgFzRJxEn/EcicnbgETO1m5fct0eGri7WK4m8kf3tZGQqY6ptzJqUWuWmBUgFjEhXRV0hTZT0SPSf/bxEL+BMFUxHP/A5/46xUkvXa5OlObu/3bWYYwg2u/55SfT39ehaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ixc78VXITgQDT5ZWX9C911+JXcEym/Nzg2y5dPMWJvc=;
 b=PMt6WtC4P4uasbyv0ObsGxDDe54WLL3tRlPd+zMrXj3/sZntfWRYVtUwBEpi6c3Uhv6+0lTqLqaWx8GOTS2loEPvHO8wWyLv3XKhAjz1VcWhChqAGcOBUTqpdQBpLu1WgwpDNO2pxV9/Jg9ICyNgYadl3Wzaf1vJFtAsyKUPJCazErmcStrtEQD+Jccm+mRKBV5QD38iqBzLkOOxEjuxz5TdapRL9wI3me+5v9YrvcURI6OWf2kZtnEuwJ9XZFtjFFE5HoXIiscRwZx461awaqgNAh+Ps2z2t4DDqr2icqWzknpJoX62QWI9jvuu3IL4ppWfsPWaekymIwJcsMvdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ixc78VXITgQDT5ZWX9C911+JXcEym/Nzg2y5dPMWJvc=;
 b=kfJlrrOcnoh7mX/TmqAtWOuS8Ad2hlTkq3Cxf/bw+cNfjM4nNwYEVj2RVj5yoEkRe9848NzZk8xVGMXQSefXMb4Deh9Cxtn43cxl8vHhn9IM1DEznkb0p9OKjD2fIGQlK5LkWek0zsnVLPruKy1DTOfuxa8Z8ysQN0qyN58hDzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f2::14)
 by AM9PR10MB4086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 11:53:59 +0000
Received: from AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f]) by AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3931:3416:1ae8:e00f%5]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 11:53:59 +0000
Message-ID: <d2fc1a0d-d058-757e-f935-1b91cfd19749@kontron.de>
Date:   Wed, 15 Feb 2023 12:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: NULL pointer dereference in imx-mipi-csis driver when starting
 stream
Content-Language: en-US
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
In-Reply-To: <7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::25) To AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:4f2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB5671:EE_|AM9PR10MB4086:EE_
X-MS-Office365-Filtering-Correlation-Id: 993b687b-4e82-4552-447e-08db0f4b530f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzPnaBcapOsSisyCE0RroJhVrI8ryaIShL7bndHjB6L2TRedglTdTHEsf9WTAWxZ5rGKvDSR9p3fmk10I8r1uItCB7ADvU3YACaTb0K4DzPi0YYOnFE7MMhOKxPfbIdV0704azFFRhLN3SBFrho6hX4t3JtNeb6gld9A20m5HPu9aBXdRoFVu7PZ06Y9caJpZ0KNQ/UC5TTcC9yz4e9R9g36sec0tHAPumXmRvovJSvgOOF8RLU80J6WrMQ38M/0fFWUwFUHNooKidP0QJA6WktlVjw4sCRGM+fLZzBYfUeiDb2f4g9nCEwDZ+ky2rQgpC/jXJLb/Mlp1pc/qSGpxQuo7aHbouIaZ1zLk69aYKQag34YtG1teFDwUbewKhX81Xl6kMN67zWJSQqok1mUTW+zqUz5JH5A5C7L5Bj+kWY614wLcgy5Mgbe2ePdYgZ+GLjgExYpnaKSW6mniufFNYpxZ8FHSvs/PpLFX4oitAc/wXYVCc07dVPmAnpOeOqjwPDRJ169WQA2I5L8Gn9lgp3dQYhdj1snulFBvH8gGmSahjlpB67K93BEfYDO/uK4VrmBPggV4+QucHwO9B9WOpmFrrecN5q5t6DjWmwavRT9R4HqZgdTlsRl0meiECGhEi9hTKLJbIWOuepd4w6UmTBQBC2fYl31IjY3LgV2SC8gd8E89YAZmQHlsf3zOSrtAo8itho/J2efqZQjxd64Q0F4feDA66OBygN4ije9yMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(86362001)(38100700002)(31696002)(66946007)(8676002)(66476007)(110136005)(4326008)(66556008)(41300700001)(316002)(2906002)(5660300002)(2616005)(8936002)(44832011)(6486002)(83380400001)(478600001)(6666004)(6506007)(186003)(6512007)(53546011)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ynh2R015T2RGVVFmd1gweG94cyt5NTI5eS9qSmtRaXRKamNtSjE5QUdETDJn?=
 =?utf-8?B?c3UrNzdjK0RGOEJEdGFuSTc4SXlnUW1PSVowdVNIZ3JOQVFSaHVJK2FqQzhH?=
 =?utf-8?B?b1F5Mjd3K2tYVC91dmRORk9HTjJFdEltNXlHNk9OTGFBdzZIWmF1dGJuVXpz?=
 =?utf-8?B?c2RIREZsdVB2ZXl2ZTkrMEplUDYwQk15U3ZlU2xMVisvMi9JQkFRNldaRDdj?=
 =?utf-8?B?aTcxVVJqM01nOElyTXVZTEFMZngwRmdMeWpXK1BobUtIVXk2S1p5TkJuMktY?=
 =?utf-8?B?SXZDK3FGU0JLblpSL203YkYxdWhmbHRZT000c0tNdWF6Szl0NExiaHBXTjU0?=
 =?utf-8?B?YUdTdnYwUmtVVWJ1VitVaEpOUUs5Y05BVzJEbk0rNUt0ZjRCT09NRjVKcVlx?=
 =?utf-8?B?azB6djF3RVpPVk01RFF3d3VYWjBlQzJmdmxTV1d3OHBLNEQ1N1dKNGRZTlAv?=
 =?utf-8?B?dCt2MHRBdWRVZ1JnN3FuUkRQOUVpaG1IOE1WNzFjS0RnSkNnUW1CcExHTGY4?=
 =?utf-8?B?aVRiazR0d0RMaVZTYVplRW1hK3I4ZWhBTXQrdGtrcjZnRmwvTGV0M1U2VzhQ?=
 =?utf-8?B?VnVXem5xZEk1UUlUV3B2TVpHWWVjcG90ZUJkZXZMSXNJRGZ6aGlwMm9YdWw1?=
 =?utf-8?B?K0tyTXIzL1B5T2NtVktObloySlc4ZWptbktKZDgwcE5oNDRsNWJaRjRlTTc4?=
 =?utf-8?B?NnprRWg1dUxNNjlXTjFRZm42ajFKOHo0VVpzN2dlcGhvWVljNTVuNkpia0pX?=
 =?utf-8?B?ekFzVE5WWTZEc0VnZFE2VTFLWmNhbXc0TXNUb1NKOWhmOGxBVW43Vmd3NUxY?=
 =?utf-8?B?c3BhMUc0aS9RTWo5TEY1TjBZRTd4N1Q3a0J2SlR4RXM4YTF3dU14U1dsanov?=
 =?utf-8?B?K3YyZ3BJRVVUWUxDckxHaWFBOXRrNW9GdHFCNVpxTFo4a3FhcVl0Nll0NDRO?=
 =?utf-8?B?QnF1eXg1VnZPbGR3NmVYZncwRGtPb3ZRaFZuUVBUU1doYlJRSFVhT2RYUFRn?=
 =?utf-8?B?ZkdQSm9xbEZkaHJQTkZXOXR1ZFFWSHl1SllvRXR0T0s2QXQzQmhYcThuV3lL?=
 =?utf-8?B?N04wVWVhNWFob21UOUFlTVh5RlNzMkVTL1dDSThoWkZ5VzMwZUtLeGhzZCtT?=
 =?utf-8?B?eFIxckVkSXVUakxnOUZqOW9KeUwzQU00ZWVrVm9HbXNhdXFxM3FvNS94Y1JM?=
 =?utf-8?B?MzVoUzd2YnNLeDAzay9BbkpnbXM5b1I1eDNFRmFHZXZTaGRpUDBpd3JBYmJQ?=
 =?utf-8?B?RHFGdTN6QXR6Y3NtcGE3cGc2aW1FWXJ2SGpBOExBUzZaWHJNd3h0QmN0MTNk?=
 =?utf-8?B?Y3NiQkczaXVnUkxkNjJXUE5zVWNoamFXUXIxRnRZYWl1TE04TEQwSGlDM2V5?=
 =?utf-8?B?N1hOYk9Ib2NrMVA2cEFVMnFOYXllc2xBSlZSOU1LdUFDd1V1QTlmdDBuQWdD?=
 =?utf-8?B?ZDdrUjUxQ1VoR0RrckZ6Z3dNZTAvWFRnUzFYeUlYSFBCdnF1c3Vqd2lCdUI4?=
 =?utf-8?B?a0ZLNUxjWkQ0SG0vQXRtaEtXdmIxTDc5ekkydW9RaE1zYW5LcFJVQmFLL3R0?=
 =?utf-8?B?UnhkWmo0WHBXR2ppUjBTTEJiaFJmVlZLQmJ1RHhIbjYxSEorb25jSGI1RUZS?=
 =?utf-8?B?dUdoZXNVYko2cXIwZVdCQlpZRkVCMmFtWGl6RHNmdENsTE1DcGJyamYwanph?=
 =?utf-8?B?YUNCVEpDeUJzQ2ZHRENNeHpBUWgxbTdZRjRZUDcyVlhuaGQyTlhoZnJtRDlZ?=
 =?utf-8?B?WVVRSFJ4Ujk2RWM4OWRaTVEvVGJobFI0SXRzaTBTRjRKeWNiSmFvMWVmZ2xD?=
 =?utf-8?B?UG9LVitUeFgzWW9KNDBTM3ZlMTJ5N2FXaG5oLzdjczM3aEtpQnc1SXM1dzVI?=
 =?utf-8?B?WEkzTjdJbGUwdWcvNzk0ZVM0ZFJnUnQwNzVFSVZxN0NiYTRyMjZ1WXJ3R05o?=
 =?utf-8?B?Y0lGbjJXUjF3eXRzTVF0ODNDdjdrSFpFbWZjYVJXWG1va2R3ODAwOWgyKzdq?=
 =?utf-8?B?N1JjRkZyWXI5aG53WUlIbEtWWFhCSlpGQnBjQk0rSjZwckZqNGU2NWNleTZQ?=
 =?utf-8?B?TTRaeXZUVkpEV3pmZnRPQVFoM01HeFh1RnpEUSt0SndmbkUvWm1SMkIvb2lq?=
 =?utf-8?B?QllKZjhQYnJUcEYwZDRmUkcxM2tvK3hHcFZDNHFTL2pqSXA3ekVVU0plUmMw?=
 =?utf-8?Q?A4G0spbqkp1dKXKGY3S/h3DRruBKLzK9qcFejhPoZtpC?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 993b687b-4e82-4552-447e-08db0f4b530f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5671.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 11:53:59.5561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNAVQfM3gE41JrAnpbQXyafRw493e3ePCncwlZXh6PDoBb+PjnIsaILVvypgeu5K+jfkCzGaHz1QXs+7SohM23sh2RFNB1FH/QjOcNrH8hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4086
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14.02.23 17:47, Frieder Schrempf wrote:
> Hi everyone,
> 
> after solving the previous devicetree and driver issues with the media
> pipeline on i.MX8MM using a RPi v2.1 camera module (imx219) as sensor, I
> now try to get an image from the sensor and run into the next problem.
> 
> Below you can find the commands I use and the output I'm getting. Maybe
> someone can see straight away what's wrong or at least can make a guess
> before I start diving into the code. ;)
> 
> By the way: This happens on v6.1.11 and 6.2-rc8.

So it looks like there are several problems (again):

First I missed to enable the link between the imx219 and the imx-mipi-csis:

media-ctl -l "'imx219 1-0010':0 -> 'csis-32e30000.mipi-csi':0[1]"

And the imx-mipi-csis driver is missing a check for the missing source
link which caused the exception. I currently have this applied and will
send this as formal patch later:

--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -596,6 +596,11 @@ static int mipi_csis_calculate_params(struct
mipi_csis_device *csis,
        s64 link_freq;
        u32 lane_rate;

+       if (!csis->src_sd) {
+               dev_err(csis->dev, "Missing source link\n");
+               return -EINVAL;
+       }
+
        /* Calculate the line rate from the pixel rate. */
        link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
                                       csis_fmt->width,

Now with this resolved, I get:

v4l2-ctl -d /dev/video0
--set-fmt-video=width=640,height=480,pixelformat=RG10 --stream-mmap
[  574.758110] imx7-csi 32e20000.csi: pipeline start failed with -32
                VIDIOC_STREAMON returned -1 (Broken pipe)

So still not there, but a bit closer ;)
Probably I'm doing something wrong when setting up the format, etc.
