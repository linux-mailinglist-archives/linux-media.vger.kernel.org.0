Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B257555D3FD
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345393AbiF1LIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 07:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345392AbiF1LIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 07:08:38 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-sl2kor01on2112.outbound.protection.outlook.com [40.107.129.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3732873A
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 04:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnj4fPcf+FeJub0I64SN6/XjvACLrT2jY/U/aB3DHgdoEx3yNa8D0kGhr1Ne6fdLXUEsfNF5r1gIVueILPBTCcw2xsqinnfI6ayw4/7W1CRWYmyAm4L4xbfOxM2gPThwGRqYOL+MsvPdTnpD4LNJIjMp9C6jfgNd38kfwmEFdAKP3MPElaUOGwl2OOUNSeNx5RMA4xSq5rVVFUfc2tX89PHfCR3OCdBYS/NPWfaBOwttHE7XoaOOS4kUSCLV8UwuQ7Z0gDdmS7dPDHNc9Q+dnf/BcKcOJQo1eiSsV3P0UoeiJ/TWDesmiV4mcu4UqPi6PpufsTy4koml1YT1BEqg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcBaZBmCbhe07jhiCziSVfZGy307gKU29CbLR4Ko8Jk=;
 b=mVNNQg6fodvURN7Fqs1aTHqXHnZFLbB2KTuYMPh2Uvy99Sw3QwFEuSDLkfSFzTLfmrXpfDzT2YNIMcetReLYr5XVV5ra1hoIivcq5xPME5NDDwEzUwFZ2UymJEzbGOnAkjlEWFeiz9ekImjiHQGyFgfkCFtooaDHNBYji9hAEJVAF8tZAhKgeltYrO501JEkvr2UuZdxu3BVGLlZlBpj8voXvpKBBLJP+1R6qKq7yLJiOLrrbuW0HrWrBQvgB2q9MtPDridAt1t53DBNJXeAnIoN4M5+V36Mko6GLKTdz0r3ZDMZo6mAA1LEgTHVspfW7mxsHmqqo6b2ZtMVOAcI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcBaZBmCbhe07jhiCziSVfZGy307gKU29CbLR4Ko8Jk=;
 b=ZJIMucqOQS170rzT9DqR+QppI91MdSaRmuz3JmgwzTcODRdbmAb0WcZosW7t8LctAwWqXyUPS14p0rbwS+QM8+lRYD3UzVWpOdSZ1xlNDVHzg2YmFfx8R3riMIC/TOEO1csQ37VQlOMurr9Ku5xwIcCeFlAy3SEyKEtOE1T5xRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0386.KORP216.PROD.OUTLOOK.COM (2603:1096:300:28::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Tue, 28 Jun 2022 11:08:36 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 11:08:36 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-staging@lists.linux.dev,
        mchehab@kernel.org, Nas Chung <nas.chung@chipsnmedia.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v9 4/6] staging: media: wave5: Add TODO file
Date:   Tue, 28 Jun 2022 20:08:19 +0900
Message-Id: <20220628110821.716-5-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628110821.716-1-nas.chung@chipsnmedia.com>
References: <20220628110821.716-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0222.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e8cf13-9cce-43c5-54f5-08da58f68c77
X-MS-TrafficTypeDiagnostic: PS2P216MB0386:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kU5addaZAh8bF1lsYZnL9fZ+6Xxv9Yq2xy7A5st8RJtL+WhZ0j0YlpaYRumu9RtMdIMKAfLi5DPCfKrZd3FIx3JL2YmR5bc/zGb1Z29KmK1qUhJ1YiDIwZ4vpsUnOoF/itPlsntN2L6KaFIshACQ81AFk/kjZ2h1ZBB4lkU2Kh+6ABmh/YltvmDUSybIToqkBKl9M3qGbGEoUlYzZNA93Rn5vMvnDqYs98xzsS7d0eX9Y+7Jb/HHB1HWOpJwR/wmSuv1/jSzElS50sJpUs8D2OlZhuOXHsSY/F1A0l0XkNmIDUVp9OvgXlAiszxvY2I7zhrXXoHca2M3HWT9ycoT+6m0sTr2C7OKbiQtuD8GHIws5wawLJ/oBXquHntN5FiDhmssZZTwn5Suv8EidNuYVX5xpTjwULMy0xelfPNrtbo4orIOUAYnaQS+LcTIMM7xIRXLTmM/vj0W5hs2IepZT9+bRfiWfWCDnxiHu9TzCxngayvr7PHzRJSp7pjhEx/9kYB9/1zmtAZNDdvOf/xVlFFr6o5mvUX4bQc/f28uiioZ4A/orXigFtEAn44QWl9472NBRJt5fgAablUmX0VvEtGAWI4BHACtFAbXtVUWiUtf1fk172sbv91gZ2f6wQHcGdVGbP9/nf+ZCvu6fOXtqiRnjn4mf9MehuXiPSTMi06Y6YEa1fABj+cRrfVkIKqD3SBOER8QC1MQCnPnYydT5GE/s62gq0rPhS/8LJG5k2wcYOFZQfwJgQwot4B7ocnma/sL8FLwE2qtyM/7ih2UK+19O78pa14lm5Kkov1ijQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(39850400004)(346002)(396003)(376002)(136003)(1076003)(66476007)(66556008)(4326008)(8676002)(6486002)(2616005)(66946007)(8936002)(6916009)(52116002)(6512007)(6506007)(186003)(6666004)(83380400001)(478600001)(54906003)(41300700001)(26005)(38100700002)(2906002)(86362001)(44832011)(5660300002)(36756003)(316002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XbJvLZrCfyIS563OeYnRdxabFWlqk0rW/PYyMidfaMyVjoga+oiIDA5MZ5kp?=
 =?us-ascii?Q?57vshU/+FpBOd/pEqHnM3w9dH/aC498jCzcNV7JA4Z4QqmxaJYaixaJ0P06R?=
 =?us-ascii?Q?WYnfG6dP9lqeO+oEFzjvecPFVP602uztOSuzpGIrtosdLK/FvErPemNIU7aR?=
 =?us-ascii?Q?W6uNF6FAAvsneQ81knlQOMU7ypRmG3L2gwgSu0WtSq/L2M++uCI8mD0fXCSi?=
 =?us-ascii?Q?whBtUFA2XvyvQuUAm0loh1new9ozBUqBr36pbdYVg62/llW8ngVJXLNcald1?=
 =?us-ascii?Q?O6FalR1TXbT8U/RsdBgxKnFjVZ9jcxhAeY6Bi4RbUW7DqZipZA+4pLMkvLLX?=
 =?us-ascii?Q?rs9+EcQdd6AK93IGsxKXhNXOTYxYupSigBIujrlJxEJ38zqT65jv29O6QgEE?=
 =?us-ascii?Q?3MHy7wZXKvW7Pz+yTvipzwkS8HbuUHAf+nopIE5KmLe8W+NCK4XbSHSKudS8?=
 =?us-ascii?Q?K4/OrbcWbdSCqnYIas85D+KO52aWWfnz46hHTAD8VKqHpizyWoeIkXlzmY8W?=
 =?us-ascii?Q?cyf57WiMnTngdvkUCnWaWX0ZAxeRcprJ3qyejgIxXOVsVv9oxXhchLoMgUSW?=
 =?us-ascii?Q?XM5pCm9od9Gje/W8l8NFobIioxLCuHeOl9YjVMsJWUDqYLFD1DLCg8m/+0Qb?=
 =?us-ascii?Q?9+m/5bMW5LV9Ag8UUPHtQ53DQTH7ruH/UIKGplacm48Ri+fxq7jR7ESfcAmc?=
 =?us-ascii?Q?kAo0Elj6j23KMz6uCbFhyJSnMIjPh3t7h0+oeUZVeDr3ZlO+Fj5w5AgLTm5k?=
 =?us-ascii?Q?9C72lR81dKquGpiZaXmLFZc2hnTWLFQ5P+jyNckuMdEVPHArN5Yg+ARC9hcs?=
 =?us-ascii?Q?XnduXhg3CyqQrwh196b64qt0cLwPXj7VbWdmFBWZoLqFeoNbLDtGhEZ1o3Rp?=
 =?us-ascii?Q?5l0Dsk7uzMVC6SJrmMe7RD0UZ+YCYkXtM356ycBj/BGPD5YGBzyx6qE/vTas?=
 =?us-ascii?Q?5bsB57XGLjjh/bMMAFVK7KfLCPJ1FmE4XUHGmQle8/3CUzq+NomId6Bt2Sgt?=
 =?us-ascii?Q?I5k8dqJJs0GKO67kbG93LkGf9ZELS8PoPvGbFdNQ3Dp8Q8r8UUIR8UeKbPQG?=
 =?us-ascii?Q?rC00/PkSakahlctwAQOMZZ5Q7t2h7l5xTdHdAweJlIPnqItpX6IbqKXc8w0Z?=
 =?us-ascii?Q?MK1OdEyowaNR7O+yOZGl4y7Y7xDHvqDMnTNBxDDA3w8kGW+36Crx9Ls9CZRt?=
 =?us-ascii?Q?QQyo2nNC86mDFSvBRe5P35kAEd6hlm3y4Iv8FHQJzE4PWOdNF+Togg5cj0HA?=
 =?us-ascii?Q?+9ntvls4KFL8pMNmpxZAZ9FVYeSryxYIKlgtUXrd52FNV7MRfAbvK+3xZQF9?=
 =?us-ascii?Q?MWEJFXw8pumVyuEESfRg6lPP3j7UKkZ6NWuHQPj1ghFJ53o2NiOg2mNjtFHV?=
 =?us-ascii?Q?w09K0CHKUcBpKYcaciEvkKmFg52BWoloUFyW5mAc3lD1KVEkUm4JiEHkOoql?=
 =?us-ascii?Q?V3dqby6NwT+yD1Ze8a7IW0gwob6obkCFph88ZOOQ1LoCJ+PaHAydpoUgD80e?=
 =?us-ascii?Q?E8weq4iF32XGkY5wba0s8wOQPX8Hrz1keY+dj4si/O+cfTfa6O9L+ctck6Mz?=
 =?us-ascii?Q?VepfQaEoUzaN3fuJ6OoE6ITzbUS3tBlusBDkmxbrutJfSVB98UAG7D5Nl+WW?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e8cf13-9cce-43c5-54f5-08da58f68c77
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 11:08:36.8801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ly3Qcno2FGUURw4wNdi/pmvBTsfPzFjItXcDAMgxYgm8zdm/vE8JtMgaEUZeE8E2n1EUETb5KfMkBX6oLpniPCKSlxRtK6bGUTq/zXaRgU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0386
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a TODO file listing all that is need for destaging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/staging/media/wave5/TODO | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 drivers/staging/media/wave5/TODO

diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5/TODO
new file mode 100644
index 000000000000..308954740eb1
--- /dev/null
+++ b/drivers/staging/media/wave5/TODO
@@ -0,0 +1,36 @@
+* Handle interrupts better
+
+Currently the interrupt handling uses an unusual design employing a kfifo to
+transfer irq status to irq thread. This was done as a work around for dropped
+interrupts seen with IRQF_ONESHOT based handling.
+
+This needs further investigation and fixing properly, with the aid of
+C&M and StarFive engineers.
+
+* appropriate error handling:
+allocation failure, mutex acquire failure etc.
+
+* remove all unused struct fields
+
+* change struct fields to 'bool' type or bitfield when appropriate
+Likely good candidates are fields named '*_enable' , '*_on'
+
+* handle vdi_allocate_dma_memory failure , each function has to clean after itself
+
+* make sure that 'u32', 's32' etc. are only used when reading/writing hw
+and change s32 to u32 when s32 is not required
+
+* power management handling - add (runtime_)suspen/resume cb where the clock is enabled
+
+* fix checkpatch issues (mostly fixes , only left to fix MACRO_ARG_REUSE, LONG_LINE)
+
+* revise logic of wave5_vpu_(dec/enc)_register_framebuffer
+
+* check if the  normal kernel endianness/__swab32 routines are sufficient. (instead of the ones
+implemented in the driver
+
+* Extended Codec Controls for encoder.
+
+implement extended codec control for HEVC/H264 encoder.
+PROFILE/LEVEL/MIN_QP/MAX_QP/LOOP_FILTER/HFLIP/VFIIP/ROTATE/
+GOP_SIZE/RC_ENABLE/I_PERIOD/BITRATE.
-- 
2.30.2

