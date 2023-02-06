Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3510B68BFFB
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 15:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjBFOYy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 09:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbjBFOYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 09:24:47 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2127.outbound.protection.outlook.com [40.107.15.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C9140EE
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 06:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZoctRxuYwZPj6a+1nt2mKKw/cgdMUy0WuiTkM+CLtvrWk4x7V/Oq7Jlh92sEecWwDwYIA+HEwQeCODLqqSQSob3Fa074wy9Xsz5X3QRb7chnxTpqpc8y8ZzowPdVgHhYKxW8OWFxBnRn2h3pLe8YKDaoVfW5OzMhkyi9bDcO9COMmMnf7MjF2fTywqCulalQSeoeIJz7CUZddASnaLAfYW1KX7yFmPZjX1Cf8WJQburStBJja+SL3E4rXvyItAnyyitcUNNgsNS6yVT9UpKaaWO9ckIfTpnucm21URR7788HldC02R7ZX7o4bkuNn/qB4eXh/TCsoN2uOU1P4ZOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKBIAfqUaZqxIIe12+iyCYSQaIZmI4Vwxoic+9mLxKQ=;
 b=bSRVBAO/U0FIaNe2t9VOoZWMvkxdgx5N8c0qMEdN2CrYg38ElEKRfAJYtz5WAkmA+eQa/kWKg5fAT1eGKOZ6nFQvE+e+rW2MvOarQGwkAOFIB/i+Jnkj5hVOE66OVagXYcWP3YQFXW2gvfmicjIuJTi3zRyO2EqvbLLMBFQGnFnkKQY+7w4tt6VfEOUvBje6UBjNxUYLx86DIzm2qKrq0vVN4zdkEd9HxcOC0pAkiSmguQMtO/O0p6MbAhvZz3Hjm8WgTIETjPqGIc0i+kySVriMXGUsXElqztNEnVmQd8aMiX6uvZKbGcySKmjLAyVryI2/nqGxEv5qwPp3wWCR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKBIAfqUaZqxIIe12+iyCYSQaIZmI4Vwxoic+9mLxKQ=;
 b=bqVICPRi48HFCxiPA7uF1HwXpdLIZukpxHd0QYhhPsgI3cnK+8XYV7SYrFB8i3BDBPKFx48WO4z223wwMBUy89cyL+xS5nUih3T0S5D2g2AZiIeGWAhXvGjIqnWYYkMhmRrySO/SNFKCyCMyj6xQ8t5+0FjTVcHmfvEZXl5/Sx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAWPR10MB6855.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:33b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:24:43 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6064.025; Mon, 6 Feb 2023
 14:24:43 +0000
Message-ID: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
Date:   Mon, 6 Feb 2023 15:24:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Capture image from imx219 sensor on i.MX8MM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAWPR10MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 994700df-5baf-4698-5498-08db084de3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aacf4aZCMa4SsX/tZIq+NBbPk4FHvbrlg8tfzdTJxZ4NApCgTajNdgGcAFcvE8XBYj049mfqXO5XFPZmncEGVoa495stakhewcGf0V3JbhRsF6QwzXWX9YWQVCn/hY/NLDmHnLrTDCk1ZOS9nRW9Od5aYUddu30ftfMDAleoviaIuTzTTSjI45ZEkF0980D7FCcewCEqNkn2rk/OfxUd3Z7TOmWC/pHr5d4n5RFkzHxIcl3VLCS9ubeW7DKD5AeB3WM4QBUREsopkpa8G6nuaLDCmhcr2rointXI8Rf7UKS49ddJ4A3eecgx++R0Px7VtARPC4+gdW+jnHGZksmP6wXQJKDuOsF3gRLqAO6xe98pSk/PBsMw1rvqFBJUB+EPAxDu7pn52AxyOnYE5Hki0HZZOZsQpbquyTqXvOifOTJ7FZxL8zZFQIwPCRQ0ivF3Ye47tLf7iq/BYvYlBw3NDV5ns5rlSXs55lC2HMJAJe8yPmusYnABKik5VQhdsXkVtdELmB2hB38iPPri3ur/aQlym3FZRMz+UIWItNUHE7FBGN/tNPIUeINfASrGo56uf4ci/EIdONpZFIFp/S01hSC8nkvBiMEibPLQU5KJZdXd8cTDw/Zxxs8E0YL97gvaaA9+u6rtgSzBcOLspOzyFXz6HpzvmRbFvODM+bUgvtlzrWfA5EwmiU1lkMB40zWurwIKcVY98iYylFfvHeWWlLPSs9iPmXUd0clT471dTOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199018)(5660300002)(86362001)(8936002)(31696002)(6512007)(26005)(186003)(38100700002)(2616005)(66946007)(110136005)(66556008)(66476007)(316002)(41300700001)(478600001)(4326008)(6486002)(6506007)(36756003)(8676002)(2906002)(31686004)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkF5ZFZGMVV5YVFwM1JwZlZqcUZHc0lmVXVhYkRwSU5JeWpCVklFVlBhQ25I?=
 =?utf-8?B?RXc3c3FweW1wMXF5Y0NwTTRCdG53ZlV2K0RxczlpeElNZC9yQmxiclZXanNu?=
 =?utf-8?B?YW53YUhKYWMyR09ZWTBPdGNQeHFlMUpicVFzMU1sU0RXR3JnZWg3bEI2K0k3?=
 =?utf-8?B?b0R0ME05Qmk4R2lveEJQNFZDL0w5emdlRjE3alhGbTNxQzVISHNYY2ZzRkUr?=
 =?utf-8?B?enJRSnZyUllQZjJqNEpZZG43M0drcXBNNGlEbk9mWDd0T1kyV1IyckM1MTBn?=
 =?utf-8?B?QjNlQ1k3aHUyTEwyNE05bnEwMUFLRTE2ZnlOSlZMQ0JnVkwweVBFOFhFbERs?=
 =?utf-8?B?aUJLdUJCRFFpVFE4WkRkVkJFSXQ4VlR6Y2syWDQyUSsxK2hDWjRnd0g3MjU5?=
 =?utf-8?B?UElOVXV5Uk1zOTZRUlFKN1A0MGowK3J3dkhXdmxKR2RPMUt5T3BET3hQcGlU?=
 =?utf-8?B?K0R3cjhRRm1qRWJ5WlliOVVoZjdHYm1uNW1NVE8xblYwMkdKVmFjWjJvbTE3?=
 =?utf-8?B?OStrTGxoWmM0MDlobHV6ekkxZjdJalEwaXp5NWswYnRMOFk0eGVZU21aaDBy?=
 =?utf-8?B?SnQ0b09ZdkptMmRpblMxM0pwb0UwQldweEY5bGRrUlFYcUIydEM0RXhNci92?=
 =?utf-8?B?N1RzRi9PVXJ3U01ibkJGM1Q4aHlRUUFjMmtzTUVrMUZLYjhlQ0lRN1h2akVK?=
 =?utf-8?B?MXRJSkg0cTVjckcrTDFqOVVtaVRZa0pxYllaTU91Q3B6WmhueEZRYnpwTjVU?=
 =?utf-8?B?T0FRQlZMSUdMeTFNTkd4b1NFN3RwVHFlSFA1UVFiNUY5OXAyajArcFJPQThK?=
 =?utf-8?B?NmZlVnVLRGZEdDVHREQyOHp5eE1ZQ2gxUFdsUTU2a1hDVGFqdlBxQjVscFZE?=
 =?utf-8?B?OTV5MnN5dDNRNGZIZzZwMGJGb1h5NU9HWjBpVnNtZGF4bXNkaW5oeS8vU3NW?=
 =?utf-8?B?NEVHUnArSGowV3JraHQ1QkNzTldkdkpSdVhVeGlkK2pMankzS0dYd3I1VXpm?=
 =?utf-8?B?UDR6Wk1yaDFmVitkNjJCRnowMmp0V0xJRG9uVkxLWTQ1aWtwUzg2RnFMQ2M0?=
 =?utf-8?B?OUZqRkgvMCtxSXVKYi9RV3VLUlVIREV3TWZ5Z08wNEcwWXk3M3B6R2lMdXp1?=
 =?utf-8?B?WE5PWDFxajFPQ21hbW8zL1ZObDdnMnB2RnVObDUveGp6K3p5QVJlWFk0dFZU?=
 =?utf-8?B?Sk1VY1BwMko2MjNWdVNDOG1zT1lIK1hJT3g4WmNIWGhlc05RMGNpWEtLRGg5?=
 =?utf-8?B?cndxMnE4cUsxRFJlK0VkVldjVFJhQjFIdU5hdXhvTmhacFhiU3lZVVQ3OFkv?=
 =?utf-8?B?eVZjRklVNTVkWjRrc0RMTHBESjU3dWluNXcrZmtMRU5jQWlHOWNWYVpnVDlh?=
 =?utf-8?B?RTdiamV4RktPaFFZbmdTdVhvQk9QSW5VMjBBQ3E3cHJkVDZBSXg2WkphWEI0?=
 =?utf-8?B?WURBMzEvZ3lFeGErUmdNRG1BMGh4M1dEMlVHb2tqdTNWd0tBRVdGNC9EQ1JZ?=
 =?utf-8?B?cXdHekJTVXRYRGZRbk1JTFpuZmNlNnFTTXJhRjlKQzlvQ2JOc29xd2tOQjJH?=
 =?utf-8?B?MWk2TnVDMklPRHF0QVNPdGZZV2k3ZlA1YmloWlVUNXNVa0dGUDVraWZVSHAw?=
 =?utf-8?B?dGRtTGMycVVycWVWUTFiTitwM2Z4SFliV2ttWmNhWitxbnd3bHlveUQrVXV1?=
 =?utf-8?B?Mi9TdEMrUCt1Q3J1eWxGVW84WjEvaVpnVVVQbTBiSGllQU9EMDF3eWlOa2E2?=
 =?utf-8?B?VGpVdm0vZGxHZGhPekY2WmNYQlgxempUWkFwOXliQ1g1UEp2U09PbjBFVGMv?=
 =?utf-8?B?R2lFcUtvdmZOZDNid0FZMUFwMGJjQ20rcTF6REZpWlpNWjB3RnBNZHVLRmVR?=
 =?utf-8?B?RnNuWDFmc2tOTEFxQTFQRHYzSUo4UWd1TTRIbk5lb0FRREtNQi9CeE5MRURk?=
 =?utf-8?B?dzFqaEl3MlBTaVZxVllQck9oWEtBaDFHYkV6eFJaWlZCOU0zbU52WHVyQk8z?=
 =?utf-8?B?TVJwaW93S2EvRVBva3Boc3JVSEFrY1g2dkdrazg3OVNJV014alhWdS81dE1L?=
 =?utf-8?B?cG4ybmpPYjBoazUxU204UzQ0YkQvZ0FpcUU0NlhuR0t0c1QraGt4NGRVdmdN?=
 =?utf-8?B?R2M4YTZQL1J1K25tc2RlOUdxV0FFaSsyNUZZL0s2dzF3b01zTHEyeVNTSk5M?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 994700df-5baf-4698-5498-08db084de3e3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:24:43.4074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMfyoEj9QLLLts9KVSmq1pSy/KZBa7rhDfevGObqHFaZyR5jrjITrs2nh4otoBuUgGrS9XhhIMPDDgd+IzV77lBi85Yy6ouRumj+3SAdHBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6855
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm trying to get a camera stream on our i.MX8MM board up and running
with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) as sensor.

I basically copied the devicetree setup from Tim's overlay at
arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts.

With all the drivers enabled the devices (imx219, imx7-media-csi,
imx-mipi-csis) seem to probe just fine and I see /dev/video0 and
/dev/media0.

For the v4l subdevices I would expect to see one for the sensor and one
for the CSI bridge. But only the latter is there (see below).

Is this correct? Am I missing something? How can I setup/enable the
pipeline/stream?

Thanks for any help!
Frieder


~# media-ctl -d /dev/media0 -p
Media controller API version 6.1.8

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info        platform:32e20000.csi
hw revision     0x0
driver version  6.1.8

Device topology
- entity 1: csi (2 pads, 1 link)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
        pad1: Source
                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
                -> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "csi":1 [ENABLED,IMMUTABLE]
