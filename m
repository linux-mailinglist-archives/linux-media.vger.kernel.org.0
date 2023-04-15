Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F866E3368
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjDOULH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjDOULB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A7635AE
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589458; i=ps.report@gmx.net;
        bh=J3z5STEeOMyfgmsI8eD2HbehKyqxwnmKsBfjxv4mjMc=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=qHkR5Z//tUzVLfZT9uTJ5+fQNVwRpAOBYua00SVUK5tOQ0V7E5dK8ZqxvqCDtciHU
         H+Lt9JjFuETmIw71LpY2JmJd1dPTgJKSL6ogk254ILU3kpB92e7AYuKMmvSVBVL1Bp
         ZTdYYDeI0zuetOjCvGKCc8BvQpWA+TBd16Xtaf9CNgROKwIK4ewmZFBawZaxG6JsM5
         INbfrza2O8OmI++5dawQBJvHou/YkQbcBbiXfaiNmXIzSBw8hlYnsNIo9AlE5h/Mb3
         kQchwqyh8QegfGo2wxeMYBi9MhaYoQAy2N51b+5Rxly0+Y3+v1tWCkLNfnf7EcUtAv
         xTor7WjW2RcPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1qLk4q3P5B-00cuQk for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:57 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 04/11] qv4l2: fix Qt6 compile (QDesktopWidget: No such file or directory)
Date:   Sat, 15 Apr 2023 22:10:49 +0200
Message-Id: <20230415201056.31080-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:zY3tyCXpLBxWiJ7uO/ED6evxE9YeMGKn0Lno+TY5F/+8GOmTw9n
 oLo772o2GU4umUPBhryQ3PbVangtRQiChRmIWLW/aU5bDUEdajUVMrclkHHEbU3J2ozbpwO
 7Ds38YlhxXdIMq+7JehqSWhR/DF/FLn8gbtHKDl/vjvvskxTemiNQ+DxjPjWpHNUzp5Fv4B
 8pqxVFO8ZKVXDZlvGBrlw==
UI-OutboundReport: notjunk:1;M01:P0:vyl5I5cyOSM=;wwLCVQlIcg0+HMSTrfx1E2dsDlH
 l0ki1Gb+DYVr64DaYZD5RQtyOAh2wms/e8p3c2pYAF0+kysxcDxSOtOL9yWkh7gkbvrmFZQGt
 ZAaERFK+r2BG2m+QLwLSSEMGE2f7BHWgMUM5JeNGl1/N1v7uIugt558Kr7GWRfAWgRPpIG9wn
 EbGV9xSTs/e/hJc0Wk5bxpUaX6MaRTORQFF3kqddvuJQWG2EqicbN+X2UFeQFOrBX6Ll8mq38
 pO5s81s2ijEKzPf4kqQI5n2JIHyukqkL3oUmhaN2qvTOQboI1AM5LOX/5sFL9kUul6MJJ3S84
 8Jcw8qR31Fn0T7VMam0xZgAjb7aq34jcCFKXA8EbISdMkJC/VJZfxOTGrkiCvFzhytE7H2o90
 FcWbf2hf1ijK0zXQpgPZKEqSraMWEhk0XmRImEyKYZef8LHynRfioXG8OzgWLUfgBHIwQsBYD
 4KAEJcxO8aX+MauGfmCAkiaRKdXqVWI1LTE5lv46f3LaGxDss2FQ/qOrr71EXBAkRZVr/hIp1
 PqBxOGAldmNBrcXlvb8QHfenkjN/iB2jGy4SqdRvZTuGsEwqWpYPhqo/lChVkiJYufHLM9zwJ
 iy7otz+mmglGapKPQgn/M8B6Htaap0Tsx3MBaJ82V+l80F42LOcPeaaQT+4SVSrKL+QbXXRqC
 xXXD2WLGzjhuU56tsciqIjk2xcphRu/+7vxrEOzkBsv/p7GRgNa94wfdtLAdJgepg1Vt8uSnx
 dyq0iZu3scLW2YR9kN9dtApyRvXORqmgEP0NtwvtXpk7yuLObhBa9ZuEAbw5clCGw8kHzc62R
 n2Dn+nHDR+7UUlst/vc9nAZaOPKJ2ObAcnSKkR6Bjt/tb7ZG+TCjG7YBc9EFv3swYry833Vko
 /AoLVmoxGNSwhFh0b8avg+gexmJgi/r2mlqHtJufqOXvxkPkb+dS0Ij+9DAmizb1RneDY9+LE
 ATYW5+0Jjp1GWZZiqIIB73p4BK8=
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LSBpbmNsdWRlIFFEZXNrdG9wV2lkZ2V0IG9ubHkgd2hlbiBuZWVkZWQgKFF0IHZlcnNvbiA8IDUu
MTAsIHNlZQogIHVzYWdlIGluIENhcHR1cmVXaW46OnNldFdpbmRvd1NpemUoKQoKU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIHV0aWxzL3F2NGwy
L2NhcHR1cmUtd2luLmNwcCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS91dGlscy9xdjRsMi9jYXB0dXJlLXdpbi5jcHAgYi91dGlscy9xdjRsMi9j
YXB0dXJlLXdpbi5jcHAKaW5kZXggOGFkZDE4ZjguLjFlMzk4NmFkIDEwMDY0NAotLS0gYS91dGls
cy9xdjRsMi9jYXB0dXJlLXdpbi5jcHAKKysrIGIvdXRpbHMvcXY0bDIvY2FwdHVyZS13aW4uY3Bw
CkBAIC0yNyw3ICsyNyw5IEBACiAjaW5jbHVkZSA8UUltYWdlPgogI2luY2x1ZGUgPFFWQm94TGF5
b3V0PgogI2luY2x1ZGUgPFFBcHBsaWNhdGlvbj4KKyNpZiBRVF9WRVJTSU9OIDwgMHgwNTBhMDAK
ICNpbmNsdWRlIDxRRGVza3RvcFdpZGdldD4KKyNlbmRpZgogI2luY2x1ZGUgPFFTY3JlZW4+CiAj
aW5jbHVkZSA8UVdpbmRvdz4KIAotLSAKMi40MC4wCgo=
