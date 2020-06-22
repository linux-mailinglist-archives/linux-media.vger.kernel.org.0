Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0905B202E30
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 03:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgFVBzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 21:55:21 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:18013 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726579AbgFVBzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 21:55:20 -0400
X-UUID: b7d23be7ed1a4b62b931b1b8c0bc6cfe-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NCLao9xja/z/UOC7Zzg8iO34wroh+bPww07IWqMYaLk=;
        b=hjEyKt3io3eUZtLFJUuMlPIB39beNwraaLB654RU0j7ofAzCEO4hZDAbEEIFWTq4ThoM49bd+gY3f1yi9Q4IBALopB0fWAJcAHfDutW3XDmEsc+eR8qkI3lnQHDbcsWhyi4HZhNcWn999uLDMPmUq7nr82Y0enUMbINQFsl1/AA=;
X-UUID: b7d23be7ed1a4b62b931b1b8c0bc6cfe-20200622
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1920484331; Mon, 22 Jun 2020 09:55:15 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Jun 2020 09:55:13 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 09:55:03 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2, 1/2] media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
Date:   Mon, 22 Jun 2020 09:52:26 +0800
Message-ID: <20200622015227.24134-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200622015227.24134-1-yunfei.dong@mediatek.com>
References: <20200622015227.24134-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBWNEwyX0JVRl9DQVBfU1VQUE9SVFNfUk9f
UkVRVUVTVFMNCmZsYWcuIFRoaXMgZmxhZyBpcyB1c2VkIGZvciBSZWFkLW9ubHkoUm8pIFJlcXVl
c3QuDQoNClNpZ25lZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5j
b20+DQotLS0NCiBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3ZpZGlvYy1y
ZXFidWZzLnJzdCB8IDQgKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvdmlkaW9j
LXJlcWJ1ZnMucnN0IGIvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC92aWRp
b2MtcmVxYnVmcy5yc3QNCmluZGV4IGI2ZDUyMDgzNzA3Yi4uN2M3NDUxNzczYjhlIDEwMDY0NA0K
LS0tIGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC92aWRpb2MtcmVxYnVm
cy5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvdmlkaW9j
LXJlcWJ1ZnMucnN0DQpAQCAtMTI2LDYgKzEyNiw3IEBAIGFib3J0aW5nIG9yIGZpbmlzaGluZyBh
bnkgRE1BIGluIHByb2dyZXNzLCBhbiBpbXBsaWNpdA0KIC4uIF9WNEwyLUJVRi1DQVAtU1VQUE9S
VFMtUkVRVUVTVFM6DQogLi4gX1Y0TDItQlVGLUNBUC1TVVBQT1JUUy1PUlBIQU5FRC1CVUZTOg0K
IC4uIF9WNEwyLUJVRi1DQVAtU1VQUE9SVFMtTTJNLUhPTEQtQ0FQVFVSRS1CVUY6DQorLi4gX1Y0
TDItQlVGLUNBUC1TVVBQT1JUUy1STy1SRVFVRVNUUzoNCiANCiAuLiBjc3NjbGFzczo6IGxvbmd0
YWJsZQ0KIA0KQEAgLTE1Niw2ICsxNTcsOSBAQCBhYm9ydGluZyBvciBmaW5pc2hpbmcgYW55IERN
QSBpbiBwcm9ncmVzcywgYW4gaW1wbGljaXQNCiAgICAgICAtIE9ubHkgdmFsaWQgZm9yIHN0YXRl
bGVzcyBkZWNvZGVycy4gSWYgc2V0LCB0aGVuIHVzZXJzcGFjZSBjYW4gc2V0IHRoZQ0KICAgICAg
ICAgYGBWNEwyX0JVRl9GTEFHX00yTV9IT0xEX0NBUFRVUkVfQlVGYGAgZmxhZyB0byBob2xkIG9m
ZiBvbiByZXR1cm5pbmcgdGhlDQogCWNhcHR1cmUgYnVmZmVyIHVudGlsIHRoZSBPVVRQVVQgdGlt
ZXN0YW1wIGNoYW5nZXMuDQorICAgICogLSBgYFY0TDJfQlVGX0NBUF9TVVBQT1JUU19ST19SRVFV
RVNUU2BgDQorICAgICAgLSAweDAwMDAwMDQwDQorICAgICAgLSBUaGlzIGJ1ZmZlciB0eXBlIHN1
cHBvcnRzIDpyZWY6YHJlcXVlc3RzIDxtZWRpYS1yZXF1ZXN0LWFwaT5gLg0KIA0KIFJldHVybiBW
YWx1ZQ0KID09PT09PT09PT09PQ0KLS0gDQoyLjE4LjANCg==

