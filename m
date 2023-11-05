Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8827E1661
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 21:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjKEUXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 15:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjKEUXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 15:23:10 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04olkn2016.outbound.protection.outlook.com [40.92.45.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15276B3
        for <linux-media@vger.kernel.org>; Sun,  5 Nov 2023 12:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3yquIiIwQExbAatvFkEeSZHMc33A2nBIm1duclP7pPEfIGEkiKDFa79fE16c7HRCz7F+9PvWA3rY+p+Iyxq5jTQH8r+Apwd+cUOmgKXJR9cg3XcCxCQZ5YHcrL5vZ4jUU1Sh+mRo1Wk32cWS29InUcP6R0w+EcrQlyWBd54cBUpoXQdO6pah2UdUMtgEUKfRa8Eu9JMG2Y7SX9W42MX+ZuWZ/BtZT29TfI0PM4nFi1KMZUFKTZCnKoiewTu2US78eNHCQqaCYRiffte0EIdh6dujlV2uW0VTJ6JlqIBJDPpWf9Mldhebq6lZy3BqITTa4fcdnLnAwEgUVsXqBIIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqcGf0GUMWHXZKF79MBytWanc1Mh2VqG78aaHlIUCvQ=;
 b=IhAWsOnzQJIM792FyV4xvxY1+CZVS9G2m0kesYjbOnqvHsBFNRUfl7WpbOBW9tCvIW5njlB+RaMAECEjKPjRbwRwk9iboTrGo7X7Se7FgxkLzYYDBqQU03IHyvcDOQvPpdboXTijARdb68f1FMS0xdL4uBMFg2x4Nrw2FrMTJkgr3lmbnsp3CmjAJHtlbHcxwr2sSw1O+6e/mOkQrwVL68PoX30nxJZkFzwzfzVxC1B3DQQYYjSrJQGLfYdo7JtkEs/JM7gbst2TdbkrJcH+xLywLLMpHVMdU88DKGlx+xq/TzjePXfYJCm1lnAhyeoOaVApTpMuJN5smbjSrkirXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqcGf0GUMWHXZKF79MBytWanc1Mh2VqG78aaHlIUCvQ=;
 b=EsE9oPYwpiZ4ujRrcUajxm+dho9IBc2WzHOo8IV8nuHtiit9PbhrinC8+KSw0DpcVsdXupIWIRbk1YDS/FftZjq9WCxeFfpROAmNy6PYqa90/zbqGAYnRvH9yvUmwmTsyKR2LRYZkDT83b+7LqsQCfBGEcKG7Gm1U+rn6C8b6VJCFA/f+n+lwn0p8NbnIJBaHKxjnMe/twbmLvJhaORQfG5Gom0nmvlEYIndGgTPyMHi192Nl0qScdHq+cWUzW33qfPt/t8jhTxdKGusF6ZZH/sMfUaUMqLQ8tgRBrIXMxl7fc9FdtnQn88mNsYecXL/IpPdTHi2acUO19AGVMe6IA==
Received: from BL3PR19MB6514.namprd19.prod.outlook.com (2603:10b6:208:3b9::10)
 by SA0PR19MB4492.namprd19.prod.outlook.com (2603:10b6:806:b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Sun, 5 Nov
 2023 20:23:05 +0000
Received: from BL3PR19MB6514.namprd19.prod.outlook.com
 ([fe80::30e:4d9f:2ff0:1d82]) by BL3PR19MB6514.namprd19.prod.outlook.com
 ([fe80::30e:4d9f:2ff0:1d82%7]) with mapi id 15.20.6954.019; Sun, 5 Nov 2023
 20:23:05 +0000
From:   Vince Ricosti <vricosti@outlook.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: How to contribute to ir-keytable/ir-ctl ?  
Thread-Topic: How to contribute to ir-keytable/ir-ctl ?  
Thread-Index: AQHaECMywP2BO9qy2kGEG20wrdPVkw==
Date:   Sun, 5 Nov 2023 20:23:04 +0000
Message-ID: <BL3PR19MB6514010EDD5F1CA2F95E1F5CD3ABA@BL3PR19MB6514.namprd19.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn:  [/2tnIo14RQ/asFs5NsVd250FQ2OsDYYJTgAuBsJ6CbqQIOMAGjnOxQ7kKnyuJv/j]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR19MB6514:EE_|SA0PR19MB4492:EE_
x-ms-office365-filtering-correlation-id: 9f0a025a-5df0-4a32-64b2-08dbde3d0446
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +wA7JEpnP877JALYmK/0Qf6lDjMEHJ4qLqcf5UsX2538aNeQ5hChQDv9l+j6mi1OzTjPQvH76zLIiOxs7/Yv9yTE2HSR0jy6dCAHTZgI3rLgOAm18ZOq+CGmUiCAA5HC2YP2rXhsvx/tTDaBM3TzoOpBGCme1XHJLkyCzHMxf/ZlP17kvPP2K9L5cvBvGLq2P4LyEcyw3HG33JwccHJ+vXneJf68dsKcBvw/E4ns+ms3eEgxAtFYCMIVGEfT1c9WxQlRlv3Z0vywtLrjxT3cEFCgy3b67pokLg4177qjmFzMx/El0EkONvZTCSDqpSNSJvfUNP3zQTkLV4EyCX4KKqwnmpR5B+j2UWdFXHLkpRD5qXMExOu/6djIvC7JoShKaItrnEp7f2BHTVK/z30jrEtCGMifCdu/CWG6sqio1sjZlO9ofP1TFr+srk3apIFPAx64b7NgJPC69xozlWyegjO8iPzYbd8wYIqH6DXNA8/AbhIG4yA7Tw3E/ZVUzCIMP53rqg7GzFVJzhLa2kE7HOnKLoycIbpE9VASW2GLMC/F9l2j9su47m1byi7qyDdW
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LcQACcJ9DBxU0FpxjRcYQIg1U+gM5asOCzVR/tag4iEAaNsv2P51O1lRAz?=
 =?iso-8859-1?Q?5pUkjPfO6HNGvKQz6vvGNqrTUhYVPvhuneoe/lC4XX+ismexqEYLYAkgBY?=
 =?iso-8859-1?Q?xdZ0gRMvKLKfYA40qMMY6AfpMmX1XH3M3ERcBMC22xwMagIq9c242anCE7?=
 =?iso-8859-1?Q?Oe7/wndGlrD6KfM5dLCt3X+BAtVCA3mabdqWvWW8tYmvgJnDqGjqc6LBSq?=
 =?iso-8859-1?Q?ttCGGqKxgJKmprvgf5Gf9vIUdh8ONZsFA2Z2dBLMt9r488ZkMZMmpMbCIN?=
 =?iso-8859-1?Q?S2hJ1zvn1cRq1usVZSRJvHo5IiIziuPx2x7yekp08eGoNpXxVBN2MaC0PO?=
 =?iso-8859-1?Q?Mfh6KrHgLI+4a2lBypD/cIcDiKVwoidQYnK0JYd0POn4z8IwkCMZpEQC7e?=
 =?iso-8859-1?Q?ZmznTAGCdmASnd0QRcqqHbL/PyN9XHY07rB+GaId54/YFziGsm63TzEx5/?=
 =?iso-8859-1?Q?H7a2edl+oAVsFQXnlXV7EDzCjCXdEvw8FrAQLl8yW0UyPHnwmktfuw7NEc?=
 =?iso-8859-1?Q?092FwFT85qIq86dPaIsWoBeSl9LNXoJrmcH+ZrTeVgzBQPZOKTeYGUZUhN?=
 =?iso-8859-1?Q?PrulNjTn7h3BdOf9YbcXHd0xUGEtHDyolRqk6IOMd5fh1hB8YL43TFHbAm?=
 =?iso-8859-1?Q?XDTDHPVBIRIrPsAcxFFqzyB2dfPbJxLMlffCGeQWjIuImp28huf6OvGKtE?=
 =?iso-8859-1?Q?bOe643nN4mLgB1NmnG8hcoWun1wunxfKBlybpFQfnjacw8OsMnzE8cBAwM?=
 =?iso-8859-1?Q?GsI8xpoarJ5oLGBvAt7Ewm+uQZv/cMTM/L4Mw/O/hoJsa4lG8xHab2DSRb?=
 =?iso-8859-1?Q?GKn+He8HdkMWr+3TfJvGp0C0ecw0S2WO3t8g5dbV/Wr4QjEDVpH0PHcv9z?=
 =?iso-8859-1?Q?LquDC7op5e1gn/9rXEjPAN05dvHxggqEx/qsUhhYqhRxObJUv5Rjpt0uVb?=
 =?iso-8859-1?Q?EJIbpvbBsAsWdlbAskyJ2i5m7zAcbAkxHs70tcM34Y/Peit2CtUQsIMxdW?=
 =?iso-8859-1?Q?VQynvAUBxgOY4yDdJDw6KG1I2Wps5f86jEdgO/p7fWvRIUKpsASiOrwk/1?=
 =?iso-8859-1?Q?KcgGHId3VZSjJSgpeWVbzDO7qxZbyNEDh71iKs4EdDk2xDuXmRnScnaswj?=
 =?iso-8859-1?Q?c0bO9pyjaH5fR86nlvipTEHi+FfZriuxiuVLXmJZIaDV9/ZVtoMft1Yp/A?=
 =?iso-8859-1?Q?BDyvGNw/E46ePerCuCUk85p1W40/ofq95G66ZxpdvrToSQCyhQyjBYChhu?=
 =?iso-8859-1?Q?C9ZHaCCqfF89gBoVsuGDFFjltc2nKFUqZ+51pYxoUPlqII8Zmcz5v8bJwt?=
 =?iso-8859-1?Q?eyli?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR19MB6514.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0a025a-5df0-4a32-64b2-08dbde3d0446
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2023 20:23:04.8636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4492
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,=0A=
I would like to contribute to the infrared source code and learn the proced=
ure for submitting patches.=0A=
My first patch is of the utmost importance :-) because here is a dump of ir=
-keytable output:=0A=
=0A=
Found /sys/class/rc/rc0/ with:=0A=
	Name: gpio_ir_recv=0A=
	Driver: gpio_ir_recv=0A=
	Default keymap: rc-rc6-mce=0A=
	Input device: /dev/input/event0=0A=
	LIRC device: /dev/lirc1=0A=
	Attached BPF protocols: Operation non permise=0A=
	Supported kernel protocols: lirc rc-5 rc-5-sz jvc sony nec sanyo mce_kbd r=
c-6 sharp xmp imon=0A=
	Enabled kernel protocols: lirc sony=0A=
	bus: 25, vendor/product: 0001:0001, version: 0x0100=0A=
	Repeat delay =3D 500 ms, repeat period =3D 125 ms=0A=
=0A=
And what annoys me if the fact that the last line does not respect the key:=
 value syntax because =0A=
we have =0A=
=0A=
Repeat delay =3D 500 ms, repeat period =3D 125 ms =0A=
instead of =0A=
Repeat delay: 500 ms, repeat period: 125 ms=0A=
=0A=
and because of this I cannot even write a simple python script to analyse t=
his output without writing some ugly code=0A=
to handle this last line.=0A=
So my first patch would be:=0A=
=0A=
Signed-off-by: Vince Ricosti <vricosti@outlook.com>=0A=
---=0A=
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c=0A=
index 3d5a3c51..62f4531e 100644=0A=
--- a/utils/keytable/keytable.c=0A=
+++ b/utils/keytable/keytable.c=0A=
@@ -1702,7 +1702,7 @@ static int get_rate(int fd, unsigned int *delay, unsi=
gned int *period)=0A=
        }=0A=
        *delay =3D rep[0];=0A=
        *period =3D rep[1];=0A=
-       printf(_("Repeat delay =3D %d ms, repeat period =3D %d ms\n"), *del=
ay, *period);=0A=
+      printf(_("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *pe=
riod);=0A=
        return 0;=0A=
 }=0A=
 =0A=
Thanks=0A=
