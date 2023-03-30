Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0DC6D0F99
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 22:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjC3UBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 16:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjC3UBK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 16:01:10 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141861024E
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 13:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1680206461; i=ps.report@gmx.net;
        bh=dsTOcrG0G0qHAXL5u31LdiSEcypvWwBcVuNvFlK9TEQ=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=gB7izNYn8UmkAkuqw02chX42rOE9v8TkLhFuiX/x9VV2rB3AoljrnXbzQ5ZsjefLw
         prRdUMJjv4bgCV++s88UHSK9BHUNsTyGtMNB48SNvszWZ/r/S0CWGf7rQg4NP/Qhl/
         V1jF24QQWVnCVMWnTloonyvFBBMPNBLh0PpQm/EIGUL+dhovFTaga89mZzb2006Yvw
         t57Ayjf9CXt4oFnabF/Yrqn2DKr8S3/AiLAm1/wC+ONw8+6Si+nw/uuNDzPL/3xgk2
         t2RF36xsDIo2LrWIXbDm83atLB6AZ1lXPYB65P+APCAnqViMzOSNLhlkh9JWogN//V
         ylWQtXIslNVdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MMXUD-1pygME0iyF-00JdrU for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023
 22:01:01 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1] meson: re-enable qv4l2 without Qt OpenGL support
Date:   Thu, 30 Mar 2023 22:01:00 +0200
Message-Id: <20230330200100.4363-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:u/VTeQ0y2hRlREl50QE2Ut8jhYquKSbSmGCuD2WQufI94p0Q06s
 PzRZwENg0juZuOzbL9EbB2ZF+OFDB9LC6HIK3Z5CP2YCcH+UxVlEx5q9vgpPS3CZiv/yS+L
 yFeBIZpe/qNY2XrCCYD012ij4wlM1xQbj5j3TjfD0OT/YDn5/Ef6VgsMkNYINK2lqOqL7Z5
 dTOsaL/hy72FfwTAoE1kw==
UI-OutboundReport: notjunk:1;M01:P0:MAu5/0nQVSU=;5ly0n1SNQCW/dxGKr5m75rJeHyu
 or0nVsAuX3Yrfs1s8zMbf1CnBlNY1E6prnxZKMGRHnGJfH5goKG/mh19bAT0hq2+3wFhJ3Vs5
 YSzLmjBGuHytyNAvBZ2AxPEwoVPaA3HBNDtOd35unnwj/fMbiwMp+U2Q8nMQHJPZWj+tOt6bF
 A3/2k9finOR3rzAgh/fkbnkGTKOcRujqfnsN10LiHjyS0ddWFaoBWgi4tLkeFbn3oHlPuhuwV
 RWGgX/c+1IAC9/+YFc95711MfUZqeMLzvjMU2xg39pR31nFTXU+QBf3S4rqPOh2ZlLradHh8R
 CNqRaryN6h7J/qZmPQ7VXThxNxB1vIOSnWI6XI4dy5VgI9/l1i53FNAlRdAeYZ5N6Il5D7hZI
 nhQD3C6+TX057pu0x7wE/hngp5NHt2TDsTQHPg+F1ntH1l34Jz8qnhGCnp3sLNrdEHdOkMCtu
 Cy+Ht8fmoPKqa8/D6ZTIZIj2dqJpT3j34A7yR3sP+dPmvt4fwRXodhj7mVpUMsfaqe+ICjQvs
 pm/7jnyAG1zZYwa17cE7ei8ywXOjzJNtcKFEirPE790Y/Ur0NKdsoh3WUgrvhP3ZxLwEBJbks
 MhWZOpmszaeZnIp2s1BBquC84viTdMAkEICz1a6FC2qUweq3NDI48DVI4dXXUTZVnYjFR8aJ2
 WPmBwEp+d45bO0Gt91vEnQRUQHyfTx4UG3xb8+cNTf3fQNTAAq+y1DDx+WPR8zcTgaQNCY+Ez
 snJxSvJQZernF83VtGX0r3DAfH7na81HS04YVe2h2/8Dc7r0T9P0awLf0l0SFyOY9UGnQwUo3
 4RtwqOii3sOOIFYT227caSNAw1IzOm6whehmfmF550GEoFKjhp7T6VqJyDj8Qs0WNWtkLxAuY
 kJKSMxfvt4eRDIEJd/daVqAf1rcrojy2RvI+dAa1+7bTK1kNi63PblSwPOm9FichH4VzY64Ha
 HlgyYGbElhuSYhQv4r7JDJPBbEk=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UmUtZW5hYmxlIHF2NGwyIHdpdGhvdXQgUXQgT3BlbkdMIHN1cHBvcnQgKGFzIHBvc3NpYmxlIHdp
dGggdGhlCmxlZ2FjeSBhdXRvY29uZi9hdXRvbWFrZSBidWlsZCBzeXN0ZW0pLgoKU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIG1lc29uLmJ1aWxk
ICAgICAgICAgICAgICAgfCAxMCArKysrKystLS0tCiB1dGlscy9xdjRsMi9tZXNvbi5idWlsZCAg
IHwgIDMgKystCiB1dGlscy9xdmlkY2FwL21lc29uLmJ1aWxkIHwgIDIgKy0KIDMgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQKaW5kZXggMWU3NmIwZjQuLmIyNzQ1MGVhIDEwMDY0NAotLS0g
YS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5idWlsZApAQCAtNzAsOCArNzAsNyBAQCBpZiBkZXBf
YWxzYS5mb3VuZCgpCiAgICAgY29uZi5zZXQoJ0hBVkVfQUxTQScsIDEpCiBlbmRpZgogCi1kZXBf
Z2wgPSBkZXBlbmRlbmN5KCdnbCcsIHJlcXVpcmVkIDogZ2V0X29wdGlvbigncXZpZGNhcCcpLmVu
YWJsZWQoKSBvcgotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF9vcHRp
b24oJ3F2NGwyJykuZW5hYmxlZCgpKQorZGVwX2dsID0gZGVwZW5kZW5jeSgnZ2wnLCByZXF1aXJl
ZCA6IGdldF9vcHRpb24oJ3F2aWRjYXAnKS5lbmFibGVkKCkpCiBkZXBfZ2x1ID0gZGVwZW5kZW5j
eSgnZ2x1JywgcmVxdWlyZWQgOiBmYWxzZSkKIAogZGVwX2pzb25jID0gZGVwZW5kZW5jeSgnanNv
bi1jJywgcmVxdWlyZWQgOiBnZXRfb3B0aW9uKCd2NGwyLXRyYWNlcicpLCB2ZXJzaW9uIDogJz49
MC4xNScpCkBAIC04MCw5ICs3OSwxMiBAQCBkZXBfbGliZGwgPSBjYy5maW5kX2xpYnJhcnkoJ2Rs
JykKIGRlcF9saWJlbGYgPSBjYy5maW5kX2xpYnJhcnkoJ2VsZicsIHJlcXVpcmVkIDogZ2V0X29w
dGlvbignYnBmJykpCiBkZXBfbGlibSA9IGNjLmZpbmRfbGlicmFyeSgnbScpCiBkZXBfbGlicnQg
PSBjYy5maW5kX2xpYnJhcnkoJ3J0JykKLWRlcF9xdDUgPSBkZXBlbmRlbmN5KCdxdDUnLCBtb2R1
bGVzOiBbJ0NvcmUnLCAnR3VpJywgJ1dpZGdldHMnLCAnT3BlbkdMJ10sCitkZXBfcXQ1ID0gZGVw
ZW5kZW5jeSgncXQ1JywgbW9kdWxlczogWydDb3JlJywgJ0d1aScsICdXaWRnZXRzJ10sCiAgICAg
ICAgICAgICAgICAgICAgICByZXF1aXJlZCA6IGdldF9vcHRpb24oJ3F2aWRjYXAnKS5lbmFibGVk
KCkgb3IgZ2V0X29wdGlvbigncXY0bDInKS5lbmFibGVkKCkpCiAKK2RlcF9xdDVfb3BlbmdsID0g
ZGVwZW5kZW5jeSgncXQ1JywgbW9kdWxlczogWydPcGVuR0wnXSwKKyAgICAgICAgICAgICAgICAg
ICAgIHJlcXVpcmVkIDogZ2V0X29wdGlvbigncXZpZGNhcCcpLmVuYWJsZWQoKSkKKwogZGVwX2xp
YmJwZiA9IGRlcGVuZGVuY3koJ2xpYmJwZicsIHJlcXVpcmVkIDogZ2V0X29wdGlvbignYnBmJyks
IHZlcnNpb24gOiAnPj0wLjcnKQogCiBkZXBfc2RsID0gZGVwZW5kZW5jeSgnU0RMMicsIHJlcXVp
cmVkOiBmYWxzZSkKQEAgLTI5MSw3ICsyOTMsNyBAQCBxdDVfb3BlbmdsX3Rlc3QgPSAnJycKICNl
bmRpZgogJycnCiBoYXZlX3F0NV9vcGVuZ2wgPSBjcHAuY29tcGlsZXMocXQ1X29wZW5nbF90ZXN0
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlcGVuZGVuY2llcyA6IFtkZXBfZ2ws
IGRlcF9xdDVdLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlcGVuZGVuY2llcyA6
IFtkZXBfZ2wsIGRlcF9xdDUsIGRlcF9xdDVfb3BlbmdsXSwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhcmdzIDogJy1mUElDJykKIGlmIGhhdmVfcXQ1X29wZW5nbAogICAgIGNvbmYu
c2V0KCdIQVZFX1FUR0wnLCAxKQpkaWZmIC0tZ2l0IGEvdXRpbHMvcXY0bDIvbWVzb24uYnVpbGQg
Yi91dGlscy9xdjRsMi9tZXNvbi5idWlsZAppbmRleCA1NDY3NmJlOC4uNDg2MGUzMzEgMTAwNjQ0
Ci0tLSBhL3V0aWxzL3F2NGwyL21lc29uLmJ1aWxkCisrKyBiL3V0aWxzL3F2NGwyL21lc29uLmJ1
aWxkCkBAIC0xLDQgKzEsNCBAQAotaWYgZ2V0X29wdGlvbigncXY0bDInKS5kaXNhYmxlZCgpIG9y
IG5vdCBkZXBfZ2wuZm91bmQoKSBvciBub3QgZGVwX3F0NS5mb3VuZCgpCitpZiBnZXRfb3B0aW9u
KCdxdjRsMicpLmRpc2FibGVkKCkgb3Igbm90IGRlcF9xdDUuZm91bmQoKQogICAgIHN1YmRpcl9k
b25lKCkKIGVuZGlmCiAKQEAgLTMzLDYgKzMzLDcgQEAgcXY0bDJfZGVwcyA9IFsKICAgICBkZXBf
bGlidjRsMnV0aWwsCiAgICAgZGVwX2xpYnY0bGNvbnZlcnQsCiAgICAgZGVwX3F0NSwKKyAgICBk
ZXBfcXQ1X29wZW5nbCwKICAgICBkZXBfdGhyZWFkcywKIF0KIApkaWZmIC0tZ2l0IGEvdXRpbHMv
cXZpZGNhcC9tZXNvbi5idWlsZCBiL3V0aWxzL3F2aWRjYXAvbWVzb24uYnVpbGQKaW5kZXggZmFh
ZTE4ZmIuLjA0NGQ4Mjk3IDEwMDY0NAotLS0gYS91dGlscy9xdmlkY2FwL21lc29uLmJ1aWxkCisr
KyBiL3V0aWxzL3F2aWRjYXAvbWVzb24uYnVpbGQKQEAgLTQsNyArNCw3IEBAIGlmIHF2aWRjYXBf
b3B0aW9uLmVuYWJsZWQoKSBhbmQgbm90IGhhdmVfcXQ1X29wZW5nbAogICAgIGVycm9yKCdxdmlk
Y2FwIGVuYWJsZWQgYnV0IFF0NSBpcyBtaXNzaW5nIE9wZW5HTCBzdXBwb3J0JykKIGVuZGlmCiAK
LWlmIHF2aWRjYXBfb3B0aW9uLmRpc2FibGVkKCkgb3Igbm90IGRlcF9nbC5mb3VuZCgpIG9yIG5v
dCBkZXBfcXQ1LmZvdW5kKCkgb3Igbm90IGhhdmVfcXQ1X29wZW5nbAoraWYgcXZpZGNhcF9vcHRp
b24uZGlzYWJsZWQoKSBvciBub3QgZGVwX2dsLmZvdW5kKCkgb3Igbm90IGRlcF9xdDVfb3Blbmds
LmZvdW5kKCkgb3Igbm90IGhhdmVfcXQ1X29wZW5nbAogICAgIHN1YmRpcl9kb25lKCkKIGVuZGlm
CiAKLS0gCjIuNDAuMAoK
