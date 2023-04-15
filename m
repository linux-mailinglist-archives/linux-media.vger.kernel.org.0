Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81FD76E336B
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 22:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjDOULJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 16:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjDOULC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 16:11:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B953C3B
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 13:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1681589459; i=ps.report@gmx.net;
        bh=bcIxcRzdhA/7wggTEsVG88G9vW/n7d2T+AnQ+d4pOCA=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=guygzjab0fVrAcpncZ89chl4r7iarhrUJSJ4tEj3IxHr9st5xgdbBB08lBdDCBhab
         oAEc6JNArMwqUP0uy+t4THpaS0VEQAnVXw8UsbSXC/+j2Gdqr/YEjLQn+owoWi/JYs
         3kdhEgDx2pqNDE0PfFAK1h+r2y3g9BrbTRjZoj+RWkxDzeO3qMhr+S4rp5Q2RONyZi
         1J+mqynto8UtQBtS5sHUBXFywSuYMZ58kWV+kY6uIgow1oCwAKM/RHcKfbsBlJ8Ns3
         1Kxx97yMJebafj3D974af7J/D01m8QbteotTrzPyoFf76IxgfZVBkyvzsvLUDkx8hS
         utq4w3/YCMEKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1qSj9442Kq-015MXL for
 <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 22:10:59 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 10/11] qv4l2: fix Qt6 warning (QMenu::addAction() is deprecated)
Date:   Sat, 15 Apr 2023 22:10:55 +0200
Message-Id: <20230415201056.31080-10-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415201056.31080-1-ps.report@gmx.net>
References: <20230415201056.31080-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:feJccnwbKU3/WWNwCHnYVfU0D16K1idzeSVAoOBCmrVGQtvt2P1
 3YW326RbSkudjcjqf6b5oW0Cp23ow4sVkd63ktLrF85ZXQnDqVBUB52W8uYZ2mqLJ50gPsT
 N/7LXFJXIoN2yVeQOSCR26I/ATphyKRt45UZAMbFADE+t91IaGEHmYbJZKSDRF30qJEpH0n
 ye9s0vsO+GaJCBFicHwgQ==
UI-OutboundReport: notjunk:1;M01:P0:J5Tx1kddJis=;tvLKJ6tv74P9EhsqQHnkCFPxtn8
 fwVAkwumnxmu64fCJezGXn4mlGgMfAOarzkOMgxinzGVtixlVy0utQcNghyfSvOmcnoN6Qxkt
 JcSnUM6oh82qj5p/iBTziHJ/kuFFrZXkWID5WY9VKfEl/d2w4COV21ZyA/Me09NK3xXdQryn3
 gzU5tDBa4Tr0So2suGNMbuM9JTWCaQllQkYJxKs2dGFnrLlJo5/N7r0H0BQyfnKRN7D+0Gkvs
 XIasU1Yra9pp9QJDOTk3CTSdL+p8tgiIGbubAul3shZyF3TU4/H6E2sVONiuem6sDTTAMpl39
 DvYjmdxraXIBbp3i1y+4PtZeUSjPp4+RwQhyC3zypRk3dFlBGl224VYDMIOcvH3zDanHJj5We
 8BgQriKyHbqhyZEqrX9t9bF7mbZRv0Q6dXVS1WqV7xUwnMXhAqhFyCWPb5FeoVBW2G0KcnZIM
 tXBL0MdxAWBXJwjtqLgKmbj7nrR8jW0sQjSgDpAQ3mq2t15tD6aoRrKxZa+EVCavNHLKkufJf
 Pm7F7izWQ6Llq9aoZbjKpvPPaBXHniknqhNoVdsOV8Y9FrYzLXTm5CV5cd8LRjNiNkwkyv29M
 xIx0uVY8+eAZdEckRCsYQ11ezM08jWyrEamQJhyxh3pyj/R2EPMxuX6a8JISzoleCZc8IaQ/9
 08JcZ33Z12HM6u+WQiB+FaE4zH7RtKY+w2+VrHPOjLWIZ4RoILHJpXf4gBjjG0sQXlm1CeVgW
 WuOD5ef7xCUoPbfQPcKQ3D5NYs571KFj3oL/OdMsRIYj40dliqk42GBhAGbJM4rCk2fJtOlus
 7EvXuXrQdkmOgDl8YG38mCNKx9e2vB7wo0vVETt/43N5UfTqcAUhi7wluO9rhaAwEIkv1bhUs
 1r7lMyCacItLdqXOn9WaSp7xroucZVdRmXZxKD0XZ00CCHRq3p329BGEmbuvY45hds64+XdWN
 2Ayno3lplnPgd6J9fzRKECmOXSw=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rml4ZXM6CgogIC4uL3F2NGwyL3F2NGwyLmNwcDozMjc6Mjg6IHdhcm5pbmc6IOKAmFFBY3Rpb24q
IFFNZW51OjphZGRBY3Rpb24oY29uc3QgUVN0cmluZyYsIGNvbnN0IFFPYmplY3QqLCBjb25zdCBj
aGFyKiwgY29uc3QgUUtleVNlcXVlbmNlJinigJkgaXMgZGVwcmVjYXRlZDogVXNlIGFkZEFjdGlv
bih0ZXh0LCBzaG9ydGN1dCwgcmVjZWl2ZXIsIG1lbWJlcikgaW5zdGVhZC4gWy1XZGVwcmVjYXRl
ZC1kZWNsYXJhdGlvbnNdCiAgICAzMjcgfCAgICAgICAgIGhlbHBNZW51LT5hZGRBY3Rpb24oIiZB
Ym91dCIsIHRoaXMsIFNMT1QoYWJvdXQoKSksIFF0OjpLZXlfRjEpOwogICAgICAgIHwgICAgICAg
ICB+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0
PgotLS0KIHV0aWxzL3F2NGwyL3F2NGwyLmNwcCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3V0aWxzL3F2NGwyL3F2NGwyLmNwcCBiL3V0aWxz
L3F2NGwyL3F2NGwyLmNwcAppbmRleCBiY2JhODhmNS4uZDRhMDYxNzEgMTAwNjQ0Ci0tLSBhL3V0
aWxzL3F2NGwyL3F2NGwyLmNwcAorKysgYi91dGlscy9xdjRsMi9xdjRsMi5jcHAKQEAgLTMyNCw3
ICszMjQsMTEgQEAgQXBwbGljYXRpb25XaW5kb3c6OkFwcGxpY2F0aW9uV2luZG93KCkgOgogI2Vu
ZGlmCiAKIAlRTWVudSAqaGVscE1lbnUgPSBtZW51QmFyKCktPmFkZE1lbnUoIiZIZWxwIik7Cisj
aWYgUVRfVkVSU0lPTiA8IDB4MDYwMDAwCiAJaGVscE1lbnUtPmFkZEFjdGlvbigiJkFib3V0Iiwg
dGhpcywgU0xPVChhYm91dCgpKSwgUXQ6OktleV9GMSk7CisjZWxzZQorCWhlbHBNZW51LT5hZGRB
Y3Rpb24oIiZBYm91dCIsIFF0OjpLZXlfRjEsIHRoaXMsIFNMT1QoYWJvdXQoKSkpOworI2VuZGlm
CiAKIAlRQWN0aW9uICp3aGF0QWN0ID0gUVdoYXRzVGhpczo6Y3JlYXRlQWN0aW9uKHRoaXMpOwog
CWhlbHBNZW51LT5hZGRBY3Rpb24od2hhdEFjdCk7Ci0tIAoyLjQwLjAKCg==
