Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9C13F28FC
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 11:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhHTJPR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 20 Aug 2021 05:15:17 -0400
Received: from mo-csw-fb1116.securemx.jp ([210.130.202.175]:35874 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbhHTJPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 05:15:16 -0400
X-Greylist: delayed 1121 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Aug 2021 05:15:16 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 17K8twCb017815; Fri, 20 Aug 2021 17:55:58 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 17K8tvfv022865; Fri, 20 Aug 2021 17:55:57 +0900
X-Iguazu-Qid: 2wHHmJkRoz21BjIAiL
X-Iguazu-QSIG: v=2; s=0; t=1629449756; q=2wHHmJkRoz21BjIAiL; m=E+DyDMf/lBpAkIioUj6/m7srFejP9gFPZ6kFhCJLHto=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1113) id 17K8tuHm023413
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 20 Aug 2021 17:55:56 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 6F6FE10012F
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 17:55:56 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 17K8tuTp019841
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 17:55:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHMYnqUcqwm6ux2kSgTP6jUvB5F41Ugs6mYl5Pa5NwkHbxEEMTHyWnKkVqmmc5FHHWSf+aerKBbnQYZv0WEYTHGVY6xbd+e62TiZnB+VZYJWEzyaP7RrcilcR+hIGy0ALs7RpQciWXIJImDhwmnDmdVWwreNkwLRzkcTnJtYgYgJkPY/5DmxkXed5/OujhtuTf9oSxLicM9PUBhc14WpZ3pb6nH5x6C4nYkRpaCXhzQTDDf7yROQXAq2W/0s9ZTfQvBu08nByS17RsiYY9asA9Dn+DUxhh79WivlKVh/J2BbOzZtgM0vblFI3ewBRTFeF3togYrRc14ruA6gKC7u3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zzHab+uTWxdP2oX8s2MsP+jxXA80fEuHGVmSo4sQJA=;
 b=g8U59sA8k0X9InG1FJW9qDI09aR2QiKsn1MjwYikBL7YfiyU95N0U4ijpWxDVL8K/hLkx5oC/MpExjXfsC5k6uh2vC3UPjm2q1RvcipWokMiLBiKBoBrpUs4NPK2aMesGmSLrpq+bOQHpGH7t/fPQRYzudN1kX4yAauSs62VSymyWp4eucW8BGOXd/CYVik7T8AALsFqBd6cGeCEWiSmBP4oznEJ3qeXhbUCOQzMoGsQ0A8tCacTvOfkDRELlO/7aErAXSmlQe3Pv4kfG6G9PLr1gi3UvM/clMALgho0f5uT4WqV0tN1kmYHrUouPrhjwSEypOAqFMoTLmkhD9Ks8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <trung1.dothanh@toshiba.co.jp>
To:     <linux-media@vger.kernel.org>
Subject: media: videobuf2: Fails to scale H264 1080p video on 1920x1080 screen
Thread-Topic: media: videobuf2: Fails to scale H264 1080p video on 1920x1080
 screen
Thread-Index: AdeVoJe9docn7NNNS8iXibN+hg0QZA==
Date:   Fri, 20 Aug 2021 08:55:53 +0000
X-TSB-HOP: ON
Message-ID: <OSAPR01MB3346DCCEBC794AD473F5D9EC93C19@OSAPR01MB3346.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82073ca4-0b70-41f0-7e95-08d963b85110
x-ms-traffictypediagnostic: OSBPR01MB2280:
x-microsoft-antispam-prvs: <OSBPR01MB2280202F4D532E03DA01897193C19@OSBPR01MB2280.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gdaxoQ9fPDptMor4dzFyAI6CzUdBuC3Ydb12sKySCWXTrCA/2Xkl5d+lGFDj1Fa1Hc4Na2c9ggaequIqoUf61WafuBsQWSKQm4dWFErGSCyT4BaW4dhmZIfVpHegdGizELgALd5My/N98dCOStVLV7tIRxtx4mktZbZtVQM97U4lBGRaU5wuNDAF4pg/hYdH0QfUPA+TQfhJjb494vETrXuwOsESGg3nCjykqKniFZwsDvruQ6kGdNfJKB4IvhFJadtOydoKYPBlrbA/l4sSh/VMkW5rEXFHwu2Occ4WGrljlHoXMHnGJw5mWK/SS0KaGLmtjD7zMTe4tkeSxz9Bo5xDbUcS+jZQGtrTYNlgnDs940mFPweJh3X6BuFNOh33mOasZf5QzDWOdsdYf9VY5TNAlC3rdDWGLEbO8DmvtKRRVIkJOlvQApzKtUqXShEh6lLYzZqZirv25RNZM9Okt0W7vf2k6yX7qZWJ0HDsvYFaQupvIl1f3dR/6Uuc6JxJvHwXSTSiTBKvjFUaBehJ3bowZg0m2KdRu/kEsFpSnTr/BzgD5sj4VifQGkQL1yZYR3hhzzjsCLTa0fbRw3eDjkexM5AS6iSxQvXwTYfZLPkEKUjH01fx01TKvcxdAmdjwVfyDqwd1F5k768Blllud5eO4om8AlZyXEV4vkbKZlk8Lo3qvIRYIKsKkD0IKrzjApWvrIXKttNdgu/zAsZnPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(5660300002)(76116006)(33656002)(186003)(38100700002)(478600001)(9686003)(6506007)(26005)(316002)(83380400001)(52536014)(64756008)(66946007)(71200400001)(66446008)(2906002)(66476007)(86362001)(7696005)(122000001)(8936002)(8676002)(6916009)(55016002)(38070700005)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?b2tkZDQ1YWwxd1VqaUFMOTBNVkhYb1hIMkMrM2FDZFdlUmxyY3I1VVdl?=
 =?iso-2022-jp?B?QmZETEJBTDZCNjhZM2o3NCtnSkJSUE1TRFlpZER0UmZienlSU2dZVzgr?=
 =?iso-2022-jp?B?ek9mTk15ZnorZE5VYjRMUUlzZFVFL0tyTzFHZlpMQytocUg4bk1BWFNS?=
 =?iso-2022-jp?B?YnZweFdtN1h4WGZXNzRGWE9UNFI0ZEFRenM4UGxCT3ZHTG84VktlcDky?=
 =?iso-2022-jp?B?WXYyRUg2d3dsZmtNWXNyeHNrVHZWSzRQMEdzZ2Q4QXIycnExakFXWktl?=
 =?iso-2022-jp?B?V3ovWjUrWDVMWFdXMWZhdGxmTFY4ZFpnRjEyTFRYUzRBcC9CS0R4cVBJ?=
 =?iso-2022-jp?B?VnpWNXVFSUdNb1ArbFdoOXRvVzlSczBDWkZoMnE0a2o4Nkl4YWh6Z2VJ?=
 =?iso-2022-jp?B?QVAraUhTOEQyWUpyS0lXYXJUVHNjM3hrdkJHOGJoYzZlS1d3WlFjYjN6?=
 =?iso-2022-jp?B?bVNDcFRZN2NXcUVScTcwRDZGYXBEQk1iNTVCSkhEUnRlVU4rNjMzRG40?=
 =?iso-2022-jp?B?Y3NaT1ZNL1pyWWgybDl6Sm5FYzE4V1Aza0xTNUtVUXJhUGhEY0xXK05r?=
 =?iso-2022-jp?B?bHhLeE15ZGFGUkpBNXVaNFh4WmdSVUhxMXlHMzA0T0RMNU1yaWtCR0NV?=
 =?iso-2022-jp?B?UDRGZnBuL2svSXltMnZ0YzJJN3JHRFo4ZkdBTnNod0lIYVo3Y1ZId2g1?=
 =?iso-2022-jp?B?WU5YRVo0bkdUZW9heURzalBXdEZHeVVWMXNSdTJuRkN0MlNEWVZBemYx?=
 =?iso-2022-jp?B?T2NrUlBtbnAwRnVCUDVScWtpV2oraHlkN1E3ZExqQ3FURUdEb1pRVmVJ?=
 =?iso-2022-jp?B?aG4xTXM0c25TT0lzcHB1b1YrWUdtdFFzQzA2Z1VYbkxQQ1ZXNzRQVWRT?=
 =?iso-2022-jp?B?U05XNHNXUUhJR3ozVy9jQlA4Uy96dWtlQVdrUGl0QUFUSHZxWE4wSHhP?=
 =?iso-2022-jp?B?Z0RYZEp3WE44dDFZUlM3d0V0RkE2UlBDZXBsSEx6RGFWQUJsa0VPc3BP?=
 =?iso-2022-jp?B?djY5RGV5cHpIZ2hOSzMyK1FCVTR5ZnR4OTNhYm9NNXpNR21HcnU2VGJv?=
 =?iso-2022-jp?B?c3hOdUVHbklTNDdBQWFxTHpKTklrSXZsUWZrdVZaNjVISTh3dkdWMCtW?=
 =?iso-2022-jp?B?SmRUU0plY3AvSWRoeGk1ZEM4NitzY0ZoNkVNMk5PSnVxUHY5TGdLMjYr?=
 =?iso-2022-jp?B?U0xuaHkvQWoyWER6VkUyNzkrRUovSEgrK01zVmN0NTdMNGtveDJ0VjUw?=
 =?iso-2022-jp?B?cjNEYnJrbHRmL1VYRHB2b01KNmJkUkFiNHFqRWtFMmE2RzFXV0ZjclFG?=
 =?iso-2022-jp?B?ZzFwemEwWStNOVl5dlhjNWFFL21OMy82MTRFRlBKZ3RmKzRkaHU4d3JI?=
 =?iso-2022-jp?B?SGlaT0FBdTM4M3NpekVnNlp4eFFPK0RoemtuS2VaTFgxMERQdEUwV1hp?=
 =?iso-2022-jp?B?cHplN2FDbmtENjhDMHFMZXNYWDcveWUxZTZ3U1Z4ZWMzdDlYdnhHZlcr?=
 =?iso-2022-jp?B?TTFBMDM2U2VGTWZtMkdPSTZGMlRyQm5YZ3FRM1NFVkhWaUpwaHRDTW5o?=
 =?iso-2022-jp?B?MHJ5UE03VGlQbEszT081eUFISzBRRTRJQk4vTWFaOGpINTU0WXp6UDZB?=
 =?iso-2022-jp?B?K0JZSU5UVHNNZ1pYdFhuN3FtazRWNVBkVmluYzRZbWRvaW8vbTZXMGF4?=
 =?iso-2022-jp?B?VFQ5RHdyNEtrODRiR2Z4Wk9zTEFXZUhCVmYvK0d5RkdvUTdpOUtHbDZu?=
 =?iso-2022-jp?B?Yk85bjI3d0UzS1VReEJtVHZkUzdMVXcwL1JiakhVTTlobG13d2tHM0hW?=
 =?iso-2022-jp?B?blRsSmczb1BqQ2J5RklWbTVOeVljdDQ1bkdoWkF5anBvcTdsOUtuTGRR?=
 =?iso-2022-jp?B?aWdERTJmRTVNSVZENW1wV3R6OUR3PQ==?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82073ca4-0b70-41f0-7e95-08d963b85110
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2021 08:55:53.3714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +AoRqNQ4irymmXnachwgCRuBO7VIx6G+u9Ft2uE+NvFmLFkQJRi5JgNRxHDfVzc03dEgTlDePyV/SjvgrRD7yetPZaQy5cQ7UTDGwrIrBR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2280
MSSCP.TransferMailToMossAgent: 103
X-OriginatorOrg: toshiba.co.jp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I am trying to play video with Gstreamer  on a fullHD monitor. The board I’m using is Apalis iMX6.
Playing video works great with v4l2h264dec:

	gst-launch-1.0 filesrc location=1080.mkv ! matroskademux ! h264parse \
                          ! v4l2h264dec capture-io-mode=dmabuf \
                          ! kmssink

However, it fails to scale video to 720p with v4l2convert:

	gst-launch-1.0 filesrc location=1080.mkv ! matroskademux ! h264parse \
                          ! v4l2h264dec capture-io-mode=dmabuf \
                          ! v4l2convert output-io-mode=dmabuf-import \
                          ! video/x-raw,width=1280,height=720 \
                          ! kmssink

Added some debugs and I found that it failed at 'drivers/media/common/videobuf2/videobuf2-v4l2.c:__verify_length()'.

	length = (b->memory == VB2_MEMORY_USERPTR)
		? b->length : vb->planes[0].length;
	if (b->bytesused > length)
		return -EINVAL;

The “b->byteused” is 4177920 (= 2 x 1920 x 1088), while plane length is just 4147200 (= 2 x 1920 x 1080).
The actual frame size of H264 video is 1920x1088, so I added  a bypass for this case and video can be scaled,
but that may not a correct way to fix this problem.

Is this a bug or I need to do extra steps before scale video?

Packages version in my environment are:
* Kernel: 5.10.19
* Gstreamer: 1.18.4

Thank you,
Trung

