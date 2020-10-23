Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A5D296BD0
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 11:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461194AbgJWJKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 05:10:54 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:44534 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S461192AbgJWJKy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 05:10:54 -0400
X-UUID: d68a97bb3f6c473f8f89147e0016c9da-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9O9vL8W8ftwpo5r9aL/7yLqe76HJJadkcFJaPM5zdZk=;
        b=cvcX2EDiBuBfykrTmf4A2XgQvoHaPSKNaX8Tr4Kpgn9H511pmRkacpY/W1G6aQ0oV8hiBXt6OLS1+WlSQ0c72ErIXzMyXBpXefOi3V23frKdE5T8niJzNYwVOJchIl+75FIJPFobftSeJpWSuC4muEtzEKtCGj8lVD5QT3IZUY0=;
X-UUID: d68a97bb3f6c473f8f89147e0016c9da-20201023
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1542337966; Fri, 23 Oct 2020 17:10:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:10:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Oct 2020 17:10:40 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     <linux-firmware@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <tiffany.lin@mediatek.com>,
        <Maoguang.Meng@mediatek.com>, <Longfei.Wang@mediatek.com>,
        <Yunfei.Dong@mediatek.com>, <Andrew-CT.Chen@mediatek.com>,
        <erin.lo@mediatek.com>, <PoChun.Lin@mediatek.com>,
        <irui.wang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: mediatek: separate venc service thread 
Date:   Fri, 23 Oct 2020 17:10:25 +0800
Message-ID: <20201023091026.32066-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 064E32424A37CD246CCD88A1AB796DE73C6A1480B4CF398B54EE122CF77318612000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgbGludXgtZmlybXdhcmUgbWFpbnRhaW5lcnMsDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgNThkNDFkMGZhY2NhMjQ3OGQzZTQ1ZjYzMjEyMjQzNjE1MTlhZWU5NjoNCg0K
ICBpY2U6IEFkZCBjb21tcyBwYWNrYWdlIGZpbGUgZm9yIEludGVsIEU4MDAgc2VyaWVzIGRyaXZl
ciAoMjAyMC0xMC0wNSAwODowOTowMyAtMDQwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL2lydWktd2FuZy9saW51eF9m
d192cHVfdjEuMS41LmdpdCB2MS4xLjUNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDc2Y2VhYzgyM2MzZjVlODY3ZThhMjJkNjUwNTk5M2ZlNDlmNjAyZDk6DQoNCiAgbWVkaWF0ZWs6
IHNlcGFyYXRlIHZlbmMgc2VydmljZSB0aHJlYWQgKDIwMjAtMTAtMjMgMTY6NDM6NTcgKzA4MDAp
DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCklydWkgV2FuZyAoMSk6DQogICAgICBtZWRpYXRlazogc2VwYXJhdGUgdmVu
YyBzZXJ2aWNlIHRocmVhZA0KDQogbWVkaWF0ZWsvbXQ4MTczL3ZwdV9kLmJpbiB8IEJpbiAyOTc3
MTg0IC0+IDI5NzcxODQgYnl0ZXMNCiBtZWRpYXRlay9tdDgxNzMvdnB1X3AuYmluIHwgQmluIDEz
MTE4MCAtPiAxMzExODAgYnl0ZXMNCiAyIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwg
MCBkZWxldGlvbnMoLSkNCg0KDQo=

