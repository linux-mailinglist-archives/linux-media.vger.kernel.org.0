Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3220429FE4
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 10:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234937AbhJLIco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 04:32:44 -0400
Received: from service.sunplusit.com ([211.20.105.19]:45471 "EHLO
        itmg.sunplusit.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234829AbhJLIcn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 04:32:43 -0400
X-MailGates: (compute_score:DELIVER,40,3)(audit_rules:UAAAAAAAAAALBAo1Kx
        ZNRjcjSVkUPl0SPEsQbXwDXHsXAARpAg9DCFwjDWNUbCY3eyQfAGhiTCkdNS0ZRjcyVwB4AV
        NBKBxWAUsLYB1/VnhpWRJcejlYew==)
X-MGADT: QAAAAAAAAAALHwo1KxZNRjcjSVkUPl0SPEsQbXwDXHsXAARpAg9DCFwjDWMwbxUWXQ0/I
        EhUWkFUFScXA29zAEpxERsLaVsX
Received: from 172.30.8.112
        by itmg2.sunplusit.com.tw with MailGates ESMTP Server V5.0(28610:0:AUTH_RELAY)
        (envelope-from <hn.chen@sunplusit.com>); Tue, 12 Oct 2021 15:59:58 +0800 (CST)
In-Reply-To: <20210915200525.448941-1-ribalda@chromium.org>
References: <20210915200525.448941-1-ribalda@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] uvcvideo: Fix hw timestamp in Sunplus modules
X-KeepSent: 2CD4BF44:6BBDEBB3-4825876C:002AB862;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3 September 15, 2011
Message-ID: <OF2CD4BF44.6BBDEBB3-ON4825876C.002AB862-4825876C.002BF1E7@sunplusit.com>
From:   hn.chen@sunplusit.com
Date:   Tue, 12 Oct 2021 15:59:59 +0800
X-MIMETrack: Serialize by Router on itmail06/SunplusIT(Release 8.5.3FP3|November 15, 2012) at
 10/12/2021 03:59:59 PM,
        Serialize complete at 10/12/2021 03:59:59 PM
Content-Type: text/plain; charset="Big5"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGVzdGVkLWJ5OiBobi5jaGVuIDxobi5jaGVuQHN1bnBsdXNpdC5jb20+DQpUaGlzIHBhdGNoZWQg
ZHJ2aWVyIGNhbiBmaW5kIHRoZSBTUElUJ3MgZGV2aWNlIHRvIHNldCB0aGUgcXVpcmsgdmFsdWUg
YW5kIA0KdGltZXN0YW1wcyBsb29rIG9rLg0KVGhlIHBsYXRmb3JtIEkgdXNlZCBpcyBhIHg2NCBw
YyBydW5uaW5nIENocm9taXVtIE9TIHdpdGgga2VybmVsIDQuMTQuDQoNCm5vdGU6IEJhY2twb3J0
ZWQgdG8gNC4xNCBmb3Igb3VyIHRlc3QgZHVlIHRvIHBsYXRmb3JtIHJlcXVpcmVtZW50cy4NCg0K
DQoNCg0KDQoNCkZyb206ICAgUmljYXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4N
ClRvOiAgICAgTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPiwgTWF1cm8gDQpDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4sIGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZywgDQpsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBo
bi5jaGVuQHN1bnBsdXNpdC5jb20sIA0KQ2M6ICAgICBSaWNhcmRvIFJpYmFsZGEgPHJpYmFsZGFA
Y2hyb21pdW0ub3JnPg0KRGF0ZTogICAyMDIxLzA5LzE2IKRXpMggMDQ6MzcNClN1YmplY3Q6ICAg
ICAgICBbUEFUQ0ggMC8zXSB1dmN2aWRlbzogRml4IGh3IHRpbWVzdGFtcCBpbiBTdW5wbHVzIG1v
ZHVsZXMNCg0KDQoNCkFkZCBhIHF1aXJrIHRvIGZpeCB0aGUgaGFyZHdhcmUgdGltZXN0YW1waW5n
IGluIFN1bnBsdXMgY2FtZXJhIG1vZHVsZXMuDQoNClJpY2FyZG8gUmliYWxkYSAoMyk6DQogIG1l
ZGlhOiB1dmM6IEV4dGVuZCBkb2N1bWVudGF0aW9uIG9mIHV2Y192aWRlb19jbG9ja19kZWNvZGUo
KQ0KICBtZWRpYTogdXZjOiBBbGxvdyBxdWlya2luZyBieSBlbnRpdHkgZ3VpZA0KICBtZWRpYTog
dXZjOiBDcmVhdGUgVVZDX1FVSVJLX0lHTk9SRV9FTVBUWV9UUyBxdWlyaw0KDQogZHJpdmVycy9t
ZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KIGRyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfdmlkZW8uYyAgfCAxMSArKysrKysrKysN
CiBkcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjdmlkZW8uaCAgIHwgIDEgKw0KIDMgZmlsZXMgY2hh
bmdlZCwgNDggaW5zZXJ0aW9ucygrKQ0KDQotLSANCjIuMzMuMC4zMDkuZzMwNTJiODk0MzgtZ29v
Zw0KDQoNCg0K
