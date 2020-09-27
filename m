Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451B027A15E
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 16:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgI0OSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 10:18:53 -0400
Received: from mail-eopbgr120084.outbound.protection.outlook.com ([40.107.12.84]:6444
        "EHLO FRA01-PR2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726281AbgI0OSx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 10:18:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYrmTf47mzNFBDOrIKo90rdwbOIbrdw3ojuKJvKFQSEsz4vekNjLRAIf68v9U3n+M2psEt3k9vVA6fOeYjohMQUcf08dDwsVajfSMuZq4ELsrHzozPImjhJYntjKoN/Nh1ToUZScgX0Hd/Galo2pnrKPvluVtr64rdbE/kzR9fM+71ZSdj5CA6vyXyhYyetk9YobjRyydVJvHLiP2bZEAFKuadFb293C4WqguMOUuFym7giWGVOY21GE0L3vlCN6QdLlsrlewsiMha8iQO2cxh3463apfwa5pUJb0b4zk0VW8Ma3y6SMKm8sygCmGvc7ekyK5Idc3v0tQPpheW13rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8kGKIMKdIi/Ojl45KHz4W5qlz37KEvFrlG/uTbThvU=;
 b=d3iFPLdnS04KIPq5z2v6Ejq2EIawdeILebzjpNGkt1UmS95am6z9bCOvQjJFAqD5HBKLHezxl58LxqVYLeTzVyGKZmbUFVO2WkrXkJSjP4rQAZca5BrsGeVJcbVtE8Myrr6OB4O/EhnChHvhVIIuZCFxVmLk2F09iGPP6gZLrkRAQ+iRDW3TFwSuqdeddiiE4WSC0kDGNtjWwT+7jKUoCXIXz1a0QCH9Btad2h3bbBA0l7p9Va5Ap4KLjwV6qFOOwVlSJGfCZ9/SBXZ5HOFgTx6xmVSLDD+qeloedhGjUkpfNeLuevmy/WAM4qYuLa2l2ShovaPfY3ygCe+12ziO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lamsade.dauphine.fr; dmarc=pass action=none
 header.from=dauphine.fr; dkim=pass header.d=dauphine.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dauphine.fr;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8kGKIMKdIi/Ojl45KHz4W5qlz37KEvFrlG/uTbThvU=;
 b=a7VekPoWEB2prD6WYhTO0zPhC3MmwkvhiejOroMPbGQkL16KnrEuA3gbWHR32c9/Sedz+nbTx1T/qbOHT2KQ6APYo8HrizAkLnugOd5A+LB7vRFPwT41jfpehvf1VlqSLx+v9ujV2QWGQfFf06JBSHnDGmkkxWkjJiF4RbcUU0k=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=dauphine.fr;
Received: from MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:9::16) by
 MR2P264MB0401.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.26; Sun, 27 Sep 2020 14:18:48 +0000
Received: from MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 ([fe80::91c4:b3f7:59a8:f55d]) by MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 ([fe80::91c4:b3f7:59a8:f55d%7]) with mapi id 15.20.3412.028; Sun, 27 Sep 2020
 14:18:48 +0000
Message-ID: <935e190390184b8985bd477939ce491731f2489f.camel@dauphine.fr>
Subject: Failed to query (129) UVC probe control
From:   Olivier Cailloux <olivier.cailloux@dauphine.fr>
To:     linux-media@vger.kernel.org
Date:   Sun, 27 Sep 2020 16:18:43 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::28) To MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:9::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from saucisson (2a01:e35:2e49:2720:18e2:21d:6da8:c492) by LO2P265CA0016.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 14:18:47 +0000
X-Originating-IP: [2a01:e35:2e49:2720:18e2:21d:6da8:c492]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fed6836-fff5-4747-c29a-08d862f03ffd
X-MS-TrafficTypeDiagnostic: MR2P264MB0401:
X-Microsoft-Antispam-PRVS: <MR2P264MB0401C967636D153B719D9802D2340@MR2P264MB0401.FRAP264.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DjIyGKAt3MbB9t0qW6lXYJXXtYY0ase80l/NId1aYQriBaMsZdBJ/kX7xneqel2B6U6kyuJepObLoIX0d6HB77zsoJHxZhf9BAkNaFJBEl/S+KNeJlZFxKO+lLHIvtfRmaHoW26ULX4ki8HWh3VHoer/HS1LTmqCM/asNvg+r/VTNQ/msRik5hUYVUXNzdub6cmZGaaSkSfZ7/K/qnIx/utQKbIucJt5aIbbBXg5l4Ul2jtPh2ocJ550fnsl63I7LFcIJpiQqR8z+IpQH8hwn0KPRWGri7V4rcLGFVGrhkIvchjZg3j5uR8iV+ma7eI3VfI2IWFCYeYt5+7CyNU+j+is/kuoM93iH/iYV4w/PV7FfFoshWw37P6o7mx3z5OOWWkr00K/FTAJ+5d5AdwVsJN9F3CW3M9vUhP6c3tQqhpbku0FZYbDQtl9XdoQR/ZY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(83380400001)(66574015)(5660300002)(66556008)(66476007)(66946007)(6666004)(83170400001)(83080400001)(8676002)(786003)(316002)(6486002)(44832011)(8936002)(478600001)(2616005)(966005)(2906002)(36756003)(6916009)(52116002)(6496006)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3mt1LsqUTGyIzGPjDpVz8cj3JbHuUZr/HDbzuS8rpX1wZdmZ+5hRmCyqhlPH1in/zhI1UL7RGVitfS9wFhYbEHpgnT1DxPPg64ldMgECtWIYK7KiImmh3v5zYRMpz5yz7lzw7eftVsX3iQ87kIlCS326NUi7o4I58VTiKO7ZfVYTzyp8OSO82xMZM0HYCsWkdHFZOO5BODD0Q/A1vjoHuCpEf0HXyQqN4SlbK5VvOa8dp2IZg25AazvJVT5fHSD0ZLa59qOdIX9elMnMTjftHekWgIYB7lt8+tVVdEmAjGj52PSPru1InaOuqo0BeS4c5wQsbAZeMgSw4JK+hYevqGQKq9JbkeMNmBXAE3ReeaOjcBrJywLa+Z8CeuOMcx+YuBiBpN5y1m9h3tybkCV/RZqE6ePqSORWdu/DbZ2zG0/tQVXMXBbqSfGGDiPXT1TYdj1OzfdLyFFvhhRPAyL6fYWYbwpSxzomi4pCmO8A1EggIZdWh4P1Wy+OjMsLPMUDsCPmq+PHHLLmSf2PbHE+E42iaAI4ZV/qRm1iDHx3hLSxD+OZuSGw4AwENNv78cKdFCUQXKeEN3DAvEWpfxY7HZZgDxYjDKUp44Y0hbPNIr00gSIxekpK8z32Yu8McROK7B+T4Esl8K/cXb6+An07/RJp7TK+AoeWaRXg0JGoWmDzGfwUycm5CwN2RSwWwyxVx1bbcLmU7XZd+QVNxfkuMw==
X-OriginatorOrg: dauphine.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fed6836-fff5-4747-c29a-08d862f03ffd
X-MS-Exchange-CrossTenant-AuthSource: MR2P264MB0244.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 14:18:48.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 81e7c4de-26c9-4531-b076-b70e2d75966e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQyKh41ogOgwMJlYHGy+nUkC9xZa4vKDBqbPMBRet+D/bqGJurl9K5Vj2ZTu2Hu55nG31v33ocN2zREm3PgPufLgX8v3YMl+NxROKazevToEsUXnQ4VMkOr4MjhK9isk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0401
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

My “Hercules Dualpix Chat and Show” Webcam (06f8:3007) is on the list
of UVC supported devices (http://www.ideasonboard.org/uvc/). Yeay!

Alas, uvcvideo fails to “initialize the device”, about 80% of the time.
I have to unplug and plug it again until it works, sometimes failing
many times in a row, sometimes with a reboot required. I am unable to
determine what makes it fail. Perhaps a relevant error given by
uvcvideo is: “Failed to query (129) UVC probe control : -32 (exp. 26)”,
in case it rings a bell. (This case reports an identical error: 
https://sourceforge.net/p/linux-uvc/mailman/message/34454922/, and this
case reports similar symptoms: 
https://www.spinics.net/lists/linux-media/msg05303.html, both with a
different device.)

Here is the relevant part of dmesg, when it fails. (I tried with “all
uvcvideo module traces enabled”, as per the troubleshooting
instructions, but it does not seem to bring supplementary relevant
data.)
[ 8204.297059]  (-> XU 6)
[ 8204.297061] uvcvideo: Found a valid video chain (1 -> 3).
[ 8204.297417] uvcvideo: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.
[ 8204.297793] uvcvideo: Failed to query (129) UVC probe control : -32
(exp. 26).
[ 8204.297799] uvcvideo: Failed to initialize the device (-5).
[ 8204.300037] usb 2-3: 3:1: cannot get freq at ep 0x84
[ 8204.381954] usb 2-3: 3:1: cannot get freq at ep 0x84
[ 8204.419980] usb 2-3: 3:1: cannot get freq at ep 0x84
[ 8209.435819] retire_capture_urb: 5003 callbacks suppressed
[ 8233.273816] usb 2-3: USB disconnect, device number 7

After this, my linux system, debian stable, fails (expectedly) to
recognise the camera, with two browsers (Firefox and Chromium).

Here is the relevant part of dmesg, when it succeeds.
[ 8114.578523]  (-> XU 6)
[ 8114.578525] uvcvideo: Found a valid video chain (1 -> 3).
[ 8114.578769] uvcvideo: UVC non compliance - GET_DEF(PROBE) not
supported. Enabling workaround.
[ 8114.579687] uvcvideo 2-3:1.0: Entity type for entity Processing 5
was not initialized!
[ 8114.579688] uvcvideo 2-3:1.0: Entity type for entity Selector 4 was
not initialized!
[ 8114.579690] uvcvideo 2-3:1.0: Entity type for entity Camera 1 was
not initialized!
[ 8114.579691] uvcvideo 2-3:1.0: Entity type for entity Guillemot
Corporation was not initialized!
[ 8114.579822] input: Hercules Dualpix Chat and Show  as
/devices/pci0000:00/0000:00:13.2/usb2/2-3/2-3:1.0/input/input19
[ 8114.579960] uvcvideo: UVC device initialized.
[ 8114.581789] usb 2-3: 3:1: cannot get freq at ep 0x84
[ 8114.630633] uvcvideo: uvc_v4l2_open
[ 8114.630712] uvcvideo: uvc_v4l2_release
[ 8114.683510] usb 2-3: 3:1: cannot get freq at ep 0x84
[ 8114.714065] usb 2-3: 3:1: cannot get freq at ep 0x84
[ 8119.878947] retire_capture_urb: 4996 callbacks suppressed
[ 8122.507661] uvcvideo: Suspending interface 1
[ 8122.507664] uvcvideo: Suspending interface 0
[ 8192.245098] usb 2-3: USB disconnect, device number 6
After this, the browsers do recognize the webcam (e.g. 
https://webrtc.github.io/test-pages/src/audio-and-video/).

Is hope permitted? Or should I just buy another webcam? Any idea is
appreciated.

-- 
Olivier

