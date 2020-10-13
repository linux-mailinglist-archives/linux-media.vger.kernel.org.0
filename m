Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD4128D057
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 16:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgJMOjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 10:39:24 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:52370 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbgJMOjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 10:39:24 -0400
Message-Id: <20201013142616.118697527@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602599962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WYttoZQBVnlZi5CIrd2nl7FrtaNidcslV10mrzt6KO8=;
        b=2ORlbvHKKR7ZAqZuOj8rj/14hza1IdaFe/bNqRgEl8hlzSBgZBLDNRwN1NQ5J0ZtZ0u70K
        qiGCbjDUBGIuEqqO+HohqaxM2USAsyPEzQlyHlwLC4Tlag3oz1mv3S/jXW8vGyQ6UIxkyy
        iPGHqF65deDukz1KUZwP42l0H7W939cLU6g3zU9oQ8WeZ5FGzRRgfCmwji77WmxL+Sc1ws
        lbQzE0Vn+saniEGA/xjoKzqNunpBWlrltr2bPtSH7QzuVCIHaFi+eHfmTGBJ510GZapEoK
        bfzDapgU5bE1bwpVvdilBE0Vb78yKguynbbtYzKNW9sMAYoxAFkYouMvXmuKlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602599962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WYttoZQBVnlZi5CIrd2nl7FrtaNidcslV10mrzt6KO8=;
        b=BdtfAdjzrcIrQ1EVLKI5m7Ukon1T7gtMt66OfUEBNDCo8ClXSr7/lPmULdKFFtT9+Diku5
        4HNAtPyRr+MkAHAw==
Date:   Tue, 13 Oct 2020 16:26:16 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [patch 0/4] media: Cleanup in_interrupt() usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rm9sa3MsCgppbiB0aGUgZGlzY3Vzc2lvbiBhYm91dCBwcmVlbXB0IGNvdW50IGNvbnNpc3RlbmN5
IGFjY3Jvc3Mga2VybmVsCmNvbmZpZ3VyYXRpb25zOgoKIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMDA5MTQyMDQyMDkuMjU2MjY2MDkzQGxpbnV0cm9uaXguZGUvCgppdCB3YXMgY29uY2x1
ZGVkIHRoYXQgdGhlIHVzYWdlIG9mIGluX2ludGVycnVwdCgpIGFuZCByZWxhdGVkIGNvbnRleHQK
Y2hlY2tzIHNob3VsZCBiZSByZW1vdmVkIGZyb20gbm9uLWNvcmUgY29kZS4KClRoZSBtZWRpYSBz
dWJzeXN0ZW0gaGFzIGEgZmV3IGluc3RhbmNlcyBvZiBpbl9pbnRlcnJ1cHQoKSB1c2FnZToKCiAx
KSBCVUdfT04oaW5faW50ZXJydXB0KCkKCiAgICBCVUdfT04oKSBpcyBjb25zaWRlcmVkIHRoZSBs
YXN0IHJlc29ydCBhbmQgdGhlIHVzYWdlIHRoZXJlIGlzIGNsZWFybHkKICAgIG5vdCBpbiB0aGF0
IGNhdGVnb3J5LiBJdCBjb3VsZCBiZSByZXBsYWNlZCBieSBhCiAgICBsb2NrZGVwX2Fzc2VydF9w
cmVlbXB0aW9uX2VuYWJsZWQoKSwgYnV0IGFsbCB0aGVzZSB1c2FnZSBzaXRlcyBpbnZva2UKICAg
IGNvcmUgZnVuY3Rpb25hbGl0eSB3aGljaCB3aWxsIGNhdGNoIGluY29ycmVjdCBjb250ZXh0IGFs
cmVhZHkuIFNvCiAgICBhZGRpbmcgbW9yZSB0aGVyZSBpcyBub3QgcmVhbGx5IHVzZWZ1bAoKIDIp
IENvbW1lbnRzIGFuZCBwcmludGsoKSdzCgogICAgVGhlIGNvbW1lbnQgaXMgbWlzbGVhZGluZyBh
bmQgdGhlIGNoZWNrcyBpbiB0aGUgcHJpbnRrKCkncyBhcmUKICAgIHBvaW50bGVzcyBhcyB0aGUg
Y29kZSBjYW4gbmV2ZXIgYmUgY2FsbGVkIGZyb20gaW5faW50ZXJydXB0KCkgYXMgaXQKICAgIGNv
bnRhaW5zIEdGUF9LRVJORUwgYWxsb2NhdGlvbnMuCgpJJ20gY29sbGVjdGluZyByZWxhdGVkIGNs
ZWFudXBzIGFsbCBvdmVyIHRoZSB0cmVlLCBidXQgZmVlbCBmcmVlIHRvIHJvdXRlCnRoZW0gdGhy
b3VnaCB0aGUgbWVkaWEgdHJlZSBhcyB0aGV5IGhhdmUgbm8gZGVwZW5kZW5jaWVzLiBMZXQgbWUg
a25vdyB3aGljaApyb3V0ZSB5b3UgcHJlZmVyLgoKVGhhbmtzLAoKCXRnbHgKLS0tCiBjb21tb24v
c2FhNzE0Ni9zYWE3MTQ2X2ZvcHMuYyB8ICAgIDIgLS0KIHBjaS9idDh4eC9idHR2LXJpc2MuYyAg
ICAgICAgIHwgICAgMSAtCiBwY2kvY3gyMzg4NS9jeDIzODg1LWNvcmUuYyAgICB8ICAgIDEgLQog
cGNpL2N4MjU4MjEvY3gyNTgyMS1jb3JlLmMgICAgfCAgICAxIC0KIHBsYXRmb3JtL2ZzbC12aXUu
YyAgICAgICAgICAgIHwgICAgMiAtLQogcGxhdGZvcm0vb21hcDNpc3AvaXNwY2NkYy5jICAgfCAg
ICA1ICsrLS0tCiB1c2IvYXUwODI4L2F1MDgyOC12aWRlby5jICAgICB8ICAgIDUgKystLS0KIHVz
Yi9jeDIzMXh4L2N4MjMxeHgtY29yZS5jICAgIHwgICAxMCArKysrLS0tLS0tCiB1c2IvY3gyMzF4
eC9jeDIzMXh4LXZiaS5jICAgICB8ICAgIDMgKy0tCiB1c2IvdG02MDAwL3RtNjAwMC12aWRlby5j
ICAgICB8ICAgIDIgLS0KIHVzYi96cjM2NHh4L3pyMzY0eHguYyAgICAgICAgIHwgICAgMiAtLQog
MTEgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCg==
