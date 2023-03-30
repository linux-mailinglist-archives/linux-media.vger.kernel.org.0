Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E1C6D0868
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 16:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjC3Ogo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 10:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbjC3Ogn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 10:36:43 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD1D5BA0
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1680186995; i=ps.report@gmx.net;
        bh=2P0Lesg+bviUAuKIQ64qnjkT3y/8RPBLOWMVVl+n8do=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=JDDP1OH3Njb9W5rBWsvTxgHzUYeCv1HHFV8ajwdPK8o+WZnc4HnzMD1FuRy4uRggf
         D6vNbmvo0e/lvR69AYxv2MxHuAo3xwgjlQ0NRgXRGHdVwXoE8JJzxjHhhMa1OFBUZq
         7APnqGHkppcWFyQ3hGNg70agj+U3TSX4Zxqvmf837H/X5KhOtAxJQcqQdnQiAo9R+n
         qwCY0go7YNvVope1Qs7wg/JIPjocmpxG2RA496WXy53bagX428rO29Yp0uO05KxUYc
         /YKVbQHOXVqOkPPo55duGHWuWbTKXBf4LVIsrMT2+ukN8fG7CTsALjvmJOC5cHmroP
         mN9aQ085xssCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1ML9uK-1q06jJ2gqI-00IGAJ for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023
 16:36:35 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1] v4l2-tracer: fix trace path name creation
Date:   Thu, 30 Mar 2023 16:36:35 +0200
Message-Id: <20230330143635.17991-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:qliWxEy0dZQ/HtVpw/cv6drgktvQM5SQYdZa/fMbpjn0E2We9pF
 3wuE3Z+N9ghk5bCCfv8hRfU6MuEUgzw2Eb33efgy+DYRcLrDS6XydlX9m3p90crDzHaR6Lx
 rq3f1M/De7QuA0YqOOhnU2cyYeY7uw2LBKYqn3Kf1G89I63PUBbM/gLjvf+zYwkeLccTfNw
 guuH4jDDroyMBa3juoTFA==
UI-OutboundReport: notjunk:1;M01:P0:9hW9hsizV1s=;DibXIlbJKXJOB9bkdkVLulCoyNE
 5UdmUempXg+KJpx0v8yWf3v0Iwhnvv/p99nkj00/0RPr2DamymZMBrpJh11gJa0Y5yttfSTOc
 3hFNdIh/zIUyjB5EarYQgarYlKTkBRR/kpFuVn86Cye/ihB4Y5BqRaCawqLyt1jzFseivpr2I
 anVkRZKNUhfSheHx9ZIp13wlWOVowW6ftRiqbSxh0mKU1dfxp/cnkKmGTg3nTdSe3xa9o3sfG
 saBQ4E6+/VqT9o4wXm2cpoMpG4WBdfO2fYfv3vuqsU1mA+hbbieOjRiCZ1gVTYc/Us8Z1Mp+B
 e5LUxr3YJvLC5yiaQMhQglBS76Jh7P60LhUyYocMEYxfs/AJlyy3OqmKJwgPcZQwaoerwqak3
 A+0TaqgNH/mKq9MjhUhvxtwtfwjmSpDZKDLcZ0MDPkvO8jc9syU/EvoLEW9OZBHnhfeHNraw5
 pjNFxnKGCYAfhk9SBEncRMfzR4g3kCBpkfonb0fKQcvW5HGJLNs16kciwK1PIxwS1E1/vs2Bs
 kiWq2Ak4PEvPPAfPhQLXHjZg36OzyIyqJxVozZwBbDPitYtP/Mm0O8OnkmJdEbYUwmb978zGx
 p5AszsNK4FCB4JEzNmkjAY5+DKPrNt8nH4Knqu062ED0pJoKJ0q+5wcoOVMbb/pzSV1t5AlgZ
 pQ3SDIDK3qIXH3T5lHKqiTkfzoWo5sV9nv59q07meY68Cg3VZn/TnX8DQzeLYmDHE7ebW7xnD
 vyMiYZQeipSxDy2c3fYAJg0Id/sCv+z8u78aZRtavrD7u6+2VyTCGEsDRvgAOJ+B4mD8E9OI8
 h/UcW6y3bkpn/69G+IvC6lgQwa6ortgXaUnRDYUjaiyLdH/HxqjEzH+2uOd72Tk4n4/RlSHUp
 XlKRVi+dbwg7dAKDZ6Kc373wLy9vNYpU4jfeJgggKy/KcrUOAMU0o3ss+Cm5Y3t5I8ZhJ3lu7
 9p8/Mw==
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rml4IHRyYWNlIHBhdGggbmFtZSBjcmVhdGlvbiBmb3IgcG9vciBtYW4ncyBkZXZlbG9wbWVudCBi
b2FyZHMKKGUuZy4gUmFzcGJlcnJ5IFBpKSB3aXRob3V0IFJUQyAoc3RhcnRpbmcgYXQgdW5peCBl
cG9jaGUgYWthIHRpbWUgMCkKYnkgZm9yY2luZyBpbml0aWFsIHRyYWNlX2lkIGNyZWF0aW9uIHdp
dGggNiB2YWxpZCBkaWdpdHMuCgpGaXhlczoKCiAgdGVybWluYXRlIGNhbGxlZCBhZnRlciB0aHJv
d2luZyBhbiBpbnN0YW5jZSBvZiAnc3RkOjpvdXRfb2ZfcmFuZ2UnCiAgICB3aGF0KCk6ICBiYXNp
Y19zdHJpbmc6OnN1YnN0cjogX19wb3MgKHdoaWNoIGlzIDUpID4gdGhpcy0+c2l6ZSgpICh3aGlj
aCBpcyAzKQogIEFib3J0ZWQKClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBv
cnRAZ214Lm5ldD4KLS0tCiB1dGlscy92NGwyLXRyYWNlci92NGwyLXRyYWNlci5jcHAgfCA2ICsr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS91dGlscy92NGwyLXRyYWNlci92NGwyLXRyYWNlci5jcHAgYi91dGlscy92NGwy
LXRyYWNlci92NGwyLXRyYWNlci5jcHAKaW5kZXggY2I4NzNkODMuLjFhOWE3ZDc1IDEwMDY0NAot
LS0gYS91dGlscy92NGwyLXRyYWNlci92NGwyLXRyYWNlci5jcHAKKysrIGIvdXRpbHMvdjRsMi10
cmFjZXIvdjRsMi10cmFjZXIuY3BwCkBAIC0yNDEsMTEgKzI0MSw5IEBAIGludCB0cmFjZXIoaW50
IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgYm9vbCByZXRyYWNlKQogCQl0cmFjZV9pZCA9IGpzb25fZmls
ZV9uYW1lLnN1YnN0cigwLCBqc29uX2ZpbGVfbmFtZS5maW5kKCIuanNvbiIpKTsKIAkJdHJhY2Vf
aWQgKz0gIl9yZXRyYWNlIjsKIAl9IGVsc2UgewotCQljb25zdCBpbnQgdGltZXN0YW1wX3N0YXJ0
X3BvcyA9IDU7Ci0JCXRyYWNlX2lkID0gc3RkOjp0b19zdHJpbmcodGltZShudWxscHRyKSk7Ci0J
CS8vIHRyYWNlX2lkID0gdHJhY2VfaWQuc3Vic3RyKHRpbWVzdGFtcF9zdGFydF9wb3MsIHN0ZDo6
c3RyaW5nOjpucG9zKSArICJfdHJhY2UiOworCQljb25zdCBpbnQgdGltZXN0YW1wX3N0YXJ0X3Bv
cyA9IDE7CisJCXRyYWNlX2lkID0gc3RkOjp0b19zdHJpbmcoMTAwMDAwICsgdGltZShudWxscHRy
KSAlIDEwMDAwMCk7CiAJCXRyYWNlX2lkID0gdHJhY2VfaWQuc3Vic3RyKHRpbWVzdGFtcF9zdGFy
dF9wb3MpICsgIl90cmFjZSI7Ci0KIAl9CiAJc2V0ZW52KCJUUkFDRV9JRCIsIHRyYWNlX2lkLmNf
c3RyKCksIDApOwogCXN0ZDo6c3RyaW5nIHRyYWNlX2ZpbGVuYW1lID0gdHJhY2VfaWQgKyAiLmpz
b24iOwotLSAKMi40MC4wCgo=
