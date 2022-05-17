Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C141529C74
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 10:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243370AbiEQI3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 04:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243198AbiEQI27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 04:28:59 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47394991A
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1652776121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DDq+kg0auq9QA8dZI9933SW5vPdIXs/7+O9RHfg41Xo=;
        b=Fns+ybdYGIx4xjxsMHNmYURhe7kxC2jwwEy2+pTm2PAWm+5FPZkVTauHLdXXLqRbDfVBap
        gn0tM8F4B+lkyF0/DXCMGZIMWpZjoFBUzh+agXlMsUVMbbsgKSCeWcbQ6/0VJg9c+Q5MVZ
        x+7VeDPVENO9Q4bWASL/0jptomCKSq8=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-F1S9Pva6NO25KzRy0cuwOg-1; Tue, 17 May 2022 10:28:39 +0200
X-MC-Unique: F1S9Pva6NO25KzRy0cuwOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgeo/nRn5RJJwFQ63NxJNKlaNFv5bsxU+Y/Tv4M3P+H4aQxGbvj9ZQn8yP2eV3roSG6S7w/uiScau+d8WpzgqmpGmytzgdlXUcAdmgzi69VI1dnb2oOwixtYU9jtqLFO9+cGw08tSUrNGVdkyBeU0JYfa5tk9HHvQFSithNBF0Tt61YqP2LQKzxP0Fs1rOqhfUsgisxHLhiNVA7v2hbT1op3GqmJAH3JChTKJLdZ1vY0DXyMw8FycdPV5w1msTgA5/YjWOrrYlbC23wtNTelfOChUKzWYWxiPON47q2W81lkpCyopzPYAO0VRSlg0MB692jyR1hUf3cMRHGnQOzglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTwPwYhw45YAsaNHAlfAlY4GLKRO+NToKRSFqtsiGaU=;
 b=J6sHrmjUBunXmePN0UIa2k7KYsfeWr5D99Hxiwt9dALiQ+rrNIwtvFEsUTA4A9auns0Bqne81EjxyZmi7AqJrCzd9OQsYH5qg4rCX0Jxst0ch8q218dC6aOCRFwaBpsGupdvdvPwAPt81M0x3ayI2TTz5p0dPKNfaWO+Z1fht8qXa/TMvYnBiM7UdHi9fBU1Xv44FSmI4ECRpKkQm27KBz0mU4p3a1rv092K4l+r1II/uflWKGWAeFTBZJ+ZkiPbKSstPIpRJLnZioFD93JYxv5a8ROSAUnErSpAjElVlpGuiSHZy89Q1OSpUryD7JF2WrjQoPNZVuugzrDrQa77Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by DB6PR0401MB2533.eurprd04.prod.outlook.com
 (2603:10a6:4:37::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 08:28:37 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c%10]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 08:28:37 +0000
Message-ID: <a9d957ce-4c20-bbb1-028f-73b4a905d0a8@suse.com>
Date:   Tue, 17 May 2022 10:28:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Content-Language: en-US
To:     Sean Young <sean@mess.org>, Oliver Neukum <oneukum@suse.com>
CC:     linux-media@vger.kernel.org, mchehab@kernel.org
References: <20220512130321.30599-1-oneukum@suse.com>
 <Yn6F87BxKsOaDYR5@gofer.mess.org>
 <2c6478af-6247-0cbf-8761-7ca288522f7f@suse.com>
 <YoJ+jhKDxUokK207@gofer.mess.org>
 <61569f96-4424-eb40-c546-47353de33501@suse.com>
 <YoNR7ngGGzqxf8+/@gofer.mess.org>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YoNR7ngGGzqxf8+/@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0149.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::22) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f0d282b-ddd2-41d6-e4d2-08da37df3d21
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2533:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB6PR0401MB253384DF8E6E2EDB125AF281C7CE9@DB6PR0401MB2533.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjZwnGgXSKwlpnm0rjfG4ZUp44dNoLzEDx9QW77g134pJ5J64in+fQReaXos6Af2ozDK//7D/SCbqN8tcwxpgHOaLqXLbuQbqftpGQAzu+U4ySgqIWQvpS2jq7zHYXGxR7Gq1M2LZqBGK69ZTcuarhj+HY/3ea/YClTIIEfUbrLTIv0t20qUMucprrLtMRZxN06G37F+MrVtVZZFTHZAYQMa3rgV+sOSK0QHKvuZ0NU3WYyV4CT74P5thiMFJmCCuhd2WQcQUNvgk414wrB1BfgHmTTPeK2oHsAytq6jvAhrPZlX2eDlxbvRMlUfzKC9onqGkR5/VswLrsZFcknVPHA6CuY53B1tPzgMQv3jf2KtNp1eX1zEIaaHiuqLPFmhumXzusEPyq5TuyjvX2RxJgG1xR9gk+DYdpChPTBBXElgF+/I6DGVTuA/6ddg0173fCZFoCF5y0ThBCTCufj8imTndf7l79g2eMY6nTtDkm8rON0kUMnPhEwqlJBAGPr15uAOPfep72/t8rrD36s3jh9B+GoFX9crYzN8npUPBnUCRyj/sXcHPACJS2yclRXTFDZBTQM/p5U4S05AmhJNN/kUiVj2XAbDZHr2I4dVmUPDSDFIzl5ZLgJYj4T9QFZoC8XjldNMQp5St1vTeI2EPxqgwtnwXM8EnVNO3Gx/0orVF7G6uGls7JlSERAdMXscF/uJ/CJ1MbW8EoSflWelsjpULxRi7eyTE2q64SD4wks=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(8676002)(4326008)(66556008)(2616005)(31696002)(316002)(38100700002)(86362001)(83380400001)(8936002)(5660300002)(53546011)(186003)(36756003)(31686004)(6506007)(6486002)(6512007)(2906002)(508600001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q01Cggl2DtUFwlfV+PeO3OQvVGHNFcsbMFoLBp4hvmF2U6vAKpsVfQWjwzll?=
 =?us-ascii?Q?faKhYXJNY5EWlh/zn4PmqR5I4Q32oHTg/zjZRHX/FnEDNN6RRKp+VrxdtHwF?=
 =?us-ascii?Q?ie5N2fTpnRXbHO0JrQ9pArYHxnmMW/SNA7Iwr+RpBr3KEM8/AXsx6sRAhuB9?=
 =?us-ascii?Q?f/oIZDl13jAMKTh7PjqrzvOQrij07mhHbzRwzsCzymL+Qkk6iaKn41DOMvjX?=
 =?us-ascii?Q?/qqiQScIn5EhRTdRyUm2jrrGdx9X3aPxdoszEIeMlFefF2+L/Oz69Moe2FJM?=
 =?us-ascii?Q?ip8FUzL6bn6UZG6DWQTdQSYX+2IGJSH+IlZVK8Y3uQopP8o4ihu6Igkt6X2L?=
 =?us-ascii?Q?0avA02LMr8A0TFxe0aAMipSmC6meomtDASdGxc8GglEw76ZZGMlBLe+lU2cO?=
 =?us-ascii?Q?mElidklMvDjcXlECVZuTc2zGgbo5wEqEki2w7UVusSGEJD4pjrfYNhgEFpOe?=
 =?us-ascii?Q?oUztZKDL80D1u51XrZ+Am8N07m9ZwwCBq4M/84W5qi+KPDRtfDgGF7TLtT/A?=
 =?us-ascii?Q?kTiT0gQ83cSSGreg4pBGKblbIuLLP83UUYy/7fgXv46aNMFhpaLtMBVQcdOR?=
 =?us-ascii?Q?yf2Xvb4l8qTCwybiUTNRjM0tvgcWlzRcsdCcWmPzHqP/dnmiTztt7IFwG0A1?=
 =?us-ascii?Q?++icTDjsiyAY/0u4PVaxe0a9fIhgvaBGGRAO3FwdZwKtb3J6X1IWJLsd+8Tq?=
 =?us-ascii?Q?vXRHVRFWBvv5WD3nhE9ED+eyNfQ5dFCBqu5MvV6hQVvUTJ9+Y6pDOZbpodX9?=
 =?us-ascii?Q?NgM3Ke6aT41TdtpA/SdToT143dZVqo3I5R7T23W3WSFQ7B1TvXR3nfSAMsJ4?=
 =?us-ascii?Q?xTODyZy/CN+QpeLlfTz0ywqcxklADRPX/fFGkhmDt8s+vVACo5YEE4wd8BFN?=
 =?us-ascii?Q?4wFJpQWGn5i0FjW4HrsXWWzmqu2yhA79Ff4C8o164ztHgSG6jyQzcYa3qlqB?=
 =?us-ascii?Q?wZbcgFzlbXLYDOdR5YrOf13YVyIBKz2v1u56W41X+YuC32klYiCMZCGodUSn?=
 =?us-ascii?Q?F3003lF13ksk7V424M/13aZk3NFugTPLjPfvtfKs4GS83jT7iwXhSZaO1Caa?=
 =?us-ascii?Q?27D8iDeoPuRzhLKB0nDd+za4Y386gFubQDMr4R5UBZO+4hNXLw+jWOamqbH5?=
 =?us-ascii?Q?0U2tyksL9sdHr36LoAQ/cHVYOyLutzgpGHLLT28IS8KW9uFtG3DUQ+lPQQ34?=
 =?us-ascii?Q?WCQTUJibBpZv7eH4NxdaNyLeBFdS3t4RM9Kan0VnXsYi4FYsIUbAfrxfxl9w?=
 =?us-ascii?Q?cjX2SJWYwGEOoa9XMdd0p8YpBTq/giNvPAxE7Ty7GthzTrZJ1zG2zINX5jNs?=
 =?us-ascii?Q?jA4wiu1mczHMPZEa3JvDrBGisPFoKIXKx1larHc7hC7GZhlGBsvT1IzDPozs?=
 =?us-ascii?Q?qGCIqGZ5gxDlYlfVawFwdupKyR5jAlWMRhNqI9l77B/9M2y1EsN4bhmUzLQN?=
 =?us-ascii?Q?X4diEMrZa3SiWOL5+hrxX/qiNiZUQwZF23AgBoPqlIxFQg77EKYRn9xR+meF?=
 =?us-ascii?Q?SuVRXwLb6ZwuNVVLdqjb0lJYh7yuc4bppc2EwKDnl8CyKO3mmUe3vx7+4JPx?=
 =?us-ascii?Q?Ajt2RLY2nmHFVAQqeK4LEGKWOIk9F532rQmJ7jvC/ZWlgbbnMTepo1rOAgbD?=
 =?us-ascii?Q?2RxIlWsNwoOrx2E97eB5fEh1VRgCBDIbG/ZgsuTXhPHpgqjcV1nKzY7QKbkb?=
 =?us-ascii?Q?htwJgOpEnmCEUdFwchQsSFL7QxTxAOyOQOUaVC8COTQ7JGKPQdoTfbs5hPS+?=
 =?us-ascii?Q?pIH7BHZqlvH6hwk6QWIPO52KU5na+6DVbiFEtoosklI4NJsO9Dy4GXeD/tNh?=
X-MS-Exchange-AntiSpam-MessageData-1: U02bspYBAABmMw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0d282b-ddd2-41d6-e4d2-08da37df3d21
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 08:28:37.1556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9A7tcnzWR5+1r5JAqt6CKoY+r2DA/K72hgO37c3T43yvfGARDht0H8OG4aSNh/hpL9fieCT1VmeCrdhfJK5dMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2533
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 17.05.22 09:42, Sean Young wrote:
> Oliver,
>
> On Tue, May 17, 2022 at 09:34:49AM +0200, Oliver Neukum wrote:
>> On 16.05.22 18:40, Sean Young wrote:
>>> On Mon, May 16, 2022 at 01:00:30PM +0200, Oliver Neukum wrote:
>>>> On 13.05.22 18:23, Sean Young wrote:
>>>> Hi!
>>>>> On Thu, May 12, 2022 at 03:03:21PM +0200, Oliver Neukum wrote:
>>>>>> No buffer can be embedded inside a descriptor, not even a simple be6=
4.
>>>>>> Use a separate kmalloc()
>>>>> This patch needs a tiny change from be64_to_cpu() to be64_to_cpup(), =
I've
>>>>> tested that change with the hardware.
>>>> Needs? It is certainly not wrong and the subsequent logging will be in=
 the
>>>> converted order, but need
>>> It certainly is wrong, and it doesn't compile without it, so yes it doe=
s
>>> need it. The kernel test robot also complained about.
>>>
>>>
>> Hi,
>>
>> sorry, it seems I forgot a "*". You are right.
> Thank you for your patches, they fix many important issues that I missed.
>
Hi,

sorry for being a bit obnoxious about this, but there is a slight issue.
This is the old code:

static void imon_ir_data(struct imon *imon)
{
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ir_raw_event rawir =3D {};
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 data =3D be64_to_cpu(imon->ir=
_buf);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 packet_no =3D data & 0xff;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int offset =3D 40;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int bit;

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (packet_no =3D=3D 0xff)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0return;

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_dbg(imon->dev, "data: %*ph", =
8, &imon->ir_buf);

The dev_dbg() logs the data as it is in the buffer. If you use
be64_to_cpup() instead of be64_to_cpu() you reverse
the buffer on a little endian CPU and hence the debug
output will be changed.
The actual driver code is unaffected, because the
buffer is never used again, so this is not a big deal.

The error is mine by changing the type of imon->ir_buf
But the fix is not quite the best.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

