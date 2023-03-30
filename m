Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84666D090E
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 17:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbjC3PGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 11:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbjC3PGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 11:06:10 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5191ABB9C
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1680188766; i=ps.report@gmx.net;
        bh=UzUTtBMgSqAInpvT37/M+h3pkYjAPNNQuTbfmVrLJ8s=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=PCO1oqosHLmU6RYfs2XOz3KL9eO+RXrY6l2XOUBl2c5fl1IL4nvF+nU8chod2L9is
         cQZYHnPIXVIcSwMqyDXS/ov4H99ZcdHwx2epvz4Vhl4lv89oxqYmdXVvjZ2JjiGIpZ
         RDMo613k25phTlNad52wM2DC5ZEgKAOBkzg4UEe8NYsvqAw5mi3yfj9zpfS9IMUnQB
         n8bskd04TPY5jvzcbAcJqIl22hSDnswdMQoIvQfBNSUJfrS3TjLUPe65Xd58xJW/gQ
         7Qx6SeoDUrVwBWAVbQLZxtttO7XVH/ty75hbDlGH4/XM+Q3sHS6Y+P1oj0ayTxOdNZ
         YOPRwSFRRssCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MtOKi-1qaHgW33mw-00uuit for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023
 17:06:06 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1] v4l2-tracer: fix 'symbol mmap64/open64 is already defined' compile failure
Date:   Thu, 30 Mar 2023 17:06:06 +0200
Message-Id: <20230330150606.20483-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:LO7t/yYIl4IfjOYlMZ2wdzsURmCgmTnUr8b3071CfU1yoeVBrG1
 S7sj1u1p8L/dFipiP5OoROXGxtNZUTXIFch/PLl1XEHlmcXm22MIRaQauG9u+NLpzFxbCw+
 EUyIdCfL2B/qu/mEjJ+hP5ZKWx1EUb+ORWeXFoyx4IsMQdrRfPrM1WzvSkA4YKCekBjxplv
 NAgZVS/GnVR+QUUmIw2Jw==
UI-OutboundReport: notjunk:1;M01:P0:HPeU8mVifBE=;wOw4IzqY7UPcxZeJCWpOn3QqBrP
 txu55pLSK10hsmOpoZSMcH3ogPypgE5uJ/YvYHv1c8OjD/jvxwgQyZHHTBLRNtJxOM7XJ4Dsl
 N67MayvC0LrMse2FaqnzmuEwyUGWr6lP/Si5S4YHDtpBXuf+9g30Hrnk4azcx8y1KCaIEJ/be
 qZAQXQnlXNf4L8iWWtjDHZmMJRxG30Ba1PqM71F+wntQn+yBowVCBu21wBO3om5QctMb8b15w
 FBVgvIrZxyvlAN8lWWh5BZAqKsr7cWHDhXJWLAhubx07SmZttArwUEbXQWNZHQz78MdUsZWkH
 vsD+81ASMQVdkZiK4+wlnxejtv/ii69QlzrmHU7pkiWeeyrZsvDFD0p4SfieGfFIIk7zVoVcM
 Jx0eL+3bqugYZn2BSj9WplAx3m0H1jNKq1hjxl+qU0qeuNXcSvwf8P+RNF3sEKa2NOCEBKozd
 qOepGQWWQKvfwhh+/X+aSLp//249CjuWkH90LhagmkrbXISDwJoztj9tHEA+MdpJIY8tiVNJn
 TbizKky9/o3Y5xQOTSnezp0Gq+9Q8LEQN97DtieCspAsPZJ6ibcAK6JgHUkTMH1RdJaqE+H6Z
 ootb7wQ9hiKTqZ1R7JfI12vtV2avFsixhZDEr+tjr64TY+4HjfdPK21sGYXXSxzZg8R5pawpx
 m/8taYD//zhzTVYIDPs0kVMSfmm/oR/yE5nOesRjR0zgWjojjDae9wKiLcOo028GGk6kefPT1
 +Wy80Npi1Q4/k3xIh64Oz8PjgflPU1MfEpF6BLIX/fRLs43ABfsc5/m3/84Gv2m1rSGKG9qlU
 q//zOgyzjVWU266mPxyaoEVhx3v11reHhJauT6CoUVuUtqrWFVp+SNBwmF9UlvhYOPdQsJAn1
 /wqoyozR9LzYzR1FwZasFhntMtzL/Ie3TY18tpdOZlpSZHG+z/3RseYBJY3X5yYy3Wube0TRh
 My3G9Yg+Nhj6s5nQcLcl+mAe18o=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Q29tcGlsaW5nIGZvciBSUGk0ICg2NC1iaXQpIHVzaW5nIGJ1aWxkcm9vdCBmYWlsZXMgd2l0aCB0
aGUgZm9sbG93aW5nCmVycm9yOgoKICAuLi4vaG9zdC9iaW4vYWFyY2g2NC1idWlsZHJvb3QtbGlu
dXgtZ251LWcrKyAtREhBVkVfQ09ORklHX0ggLUkuIC1JLi4vLi4gLUkuLi8uLi91dGlscy9jb21t
b24gLUkuLi4vYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUv
anNvbi1jIC1JLi4vLi4vbGliL2luY2x1ZGUgLVdhbGwgLVdwb2ludGVyLWFyaXRoIC1EX0dOVV9T
T1VSQ0UgLUkuLi8uLi9pbmNsdWRlIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRf
U09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJH
RUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtT3MgLWcwIC1EX0ZPUlRJRllf
U09VUkNFPTEgLXN0ZD1nbnUrKzExIC1jIGxpYnY0bDJ0cmFjZXIuY3BwICAtZlBJQyAtRFBJQyAt
byAubGlicy9saWJ2NGwydHJhY2VyX2xhLWxpYnY0bDJ0cmFjZXIubwogIC90bXAvY2NmYmVjdFku
czogQXNzZW1ibGVyIG1lc3NhZ2VzOgogIC90bXAvY2NmYmVjdFkuczoyMDg6IEVycm9yOiBzeW1i
b2wgYG9wZW42NCcgaXMgYWxyZWFkeSBkZWZpbmVkCiAgL3RtcC9jY2ZiZWN0WS5zOjc2MjogRXJy
b3I6IHN5bWJvbCBgbW1hcDY0JyBpcyBhbHJlYWR5IGRlZmluZWQKClRoZSBwcmVwcm9jZXNzb3Ig
b3V0cHV0IHNob3dzOgoKICBbLi4uXQogIGV4dGVybiAiQyIgewogICMgNjEgIi4uLi9ob3N0L2Fh
cmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL3N5cy9tbWFuLmgi
IDMgNAogIGV4dGVybiB2b2lkICogbW1hcCAodm9pZCAqX19hZGRyLCBzaXplX3QgX19sZW4sIGlu
dCBfX3Byb3QsIGludCBfX2ZsYWdzLCBpbnQgX19mZCwgX19vZmY2NF90IF9fb2Zmc2V0KSBub2V4
Y2VwdCAodHJ1ZSkgX19hc21fXyAoIiIgIm1tYXA2NCIpOwogIFsuLi5dCiAgZXh0ZXJuIHZvaWQg
Km1tYXA2NCAodm9pZCAqX19hZGRyLCBzaXplX3QgX19sZW4sIGludCBfX3Byb3QsCiAgICAgICAg
IGludCBfX2ZsYWdzLCBpbnQgX19mZCwgX19vZmY2NF90IF9fb2Zmc2V0KSBub2V4Y2VwdCAodHJ1
ZSk7CgpBbmQgaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5j
bHVkZS9zeXMvbW1hbi5oOgoKICA1NiAjaWZuZGVmIF9fVVNFX0ZJTEVfT0ZGU0VUNjQKICA1NyBl
eHRlcm4gdm9pZCAqbW1hcCAodm9pZCAqX19hZGRyLCBzaXplX3QgX19sZW4sIGludCBfX3Byb3Qs
CiAgNTggICAgICAgICAgICAgICAgICAgIGludCBfX2ZsYWdzLCBpbnQgX19mZCwgX19vZmZfdCBf
X29mZnNldCkgX19USFJPVzsKICA1OSAjZWxzZQogIDYwICMgaWZkZWYgX19SRURJUkVDVF9OVEgK
ICA2MSBleHRlcm4gdm9pZCAqIF9fUkVESVJFQ1RfTlRIIChtbWFwLAogIDYyICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICh2b2lkICpfX2FkZHIsIHNpemVfdCBfX2xlbiwgaW50IF9fcHJv
dCwKICA2MyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IF9fZmxhZ3MsIGludCBf
X2ZkLCBfX29mZjY0X3QgX19vZmZzZXQpLAogIDY0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1tYXA2NCk7CiAgNjUgIyBlbHNlCiAgNjYgIyAgZGVmaW5lIG1tYXAgbW1hcDY0CiAgNjcg
IyBlbmRpZgogIDY4ICNlbmRpZgogIDY5ICNpZmRlZiBfX1VTRV9MQVJHRUZJTEU2NAogIDcwIGV4
dGVybiB2b2lkICptbWFwNjQgKHZvaWQgKl9fYWRkciwgc2l6ZV90IF9fbGVuLCBpbnQgX19wcm90
LAogIDcxICAgICAgICAgICAgICAgICAgICAgIGludCBfX2ZsYWdzLCBpbnQgX19mZCwgX19vZmY2
NF90IF9fb2Zmc2V0KSBfX1RIUk9XOwogIDcyICNlbmRpZgoKRml4IGl0IGJ5IGFwcGx5aW5nIHRo
ZSBzYW1lIHVuZGVmIF9MQVJHRUZJTEVfU09VUkNFL19GSUxFX09GRlNFVF9CSVRTLApkZWZpbmUg
X0xBUkdFRklMRTY0X1NPVVJDRSBhcyBpbiBhcyBpbiBsaWIvbGlidjRsMS92NGwxY29tcGF0LmMK
ClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCk5v
dGVzOgoKICAtIG1heWJlIHRoZSAnZGVmaW5lZChsaW51eCkgJiYgZGVmaW5lZChfX0dMSUJDX18p
JyBwcm90ZWN0aW9uCiAgICBwcmVzZW50IGluIGxpYi9saWJ2NGwxL3Y0bDFjb21wYXQuYyBmb3Ig
b3BlbjY0L21tYXA2NCBpcyBuZWVkZWQKICAgIGZvciBub24gZ2xpYmMgY29tcGlsZXMgb2YgdXRp
bHMvdjRsMi10cmFjZXIvbGlidjRsMnRyYWNlci5jcHAgdG9vPwotLS0KIHV0aWxzL3Y0bDItdHJh
Y2VyL2xpYnY0bDJ0cmFjZXIuY3BwIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3V0aWxzL3Y0bDItdHJhY2VyL2xpYnY0bDJ0cmFjZXIuY3Bw
IGIvdXRpbHMvdjRsMi10cmFjZXIvbGlidjRsMnRyYWNlci5jcHAKaW5kZXggYTlmMDM5YzcuLjFl
MzkwMGRiIDEwMDY0NAotLS0gYS91dGlscy92NGwyLXRyYWNlci9saWJ2NGwydHJhY2VyLmNwcAor
KysgYi91dGlscy92NGwyLXRyYWNlci9saWJ2NGwydHJhY2VyLmNwcApAQCAtMyw2ICszLDExIEBA
CiAgKiBDb3B5cmlnaHQgMjAyMiBDb2xsYWJvcmEgTHRkLgogICovCiAKKy8qIGVuc3VyZSB3ZSBz
ZWUgKjY0IHZhcmlhbnRzIGFuZCB0aGV5IGFyZW4ndCB0cmFuc3BhcmVudGx5IHVzZWQgKi8KKyN1
bmRlZiBfTEFSR0VGSUxFX1NPVVJDRQorI3VuZGVmIF9GSUxFX09GRlNFVF9CSVRTCisjZGVmaW5l
IF9MQVJHRUZJTEU2NF9TT1VSQ0UgMQorCiAjaW5jbHVkZSAidHJhY2UuaCIKICNpbmNsdWRlIDxk
bGZjbi5oPgogI2luY2x1ZGUgPHN0ZGFyZy5oPgotLSAKMi40MC4wCgo=
