Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B8C3092EF
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 10:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhA3JKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 04:10:41 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39573 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231213AbhA3JJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 04:09:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5mFGlj9hsefbk5mFJlbRmZ; Sat, 30 Jan 2021 10:08:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611997725; bh=kFzR3Clz9QcOHzi8a7nlXc/7LsUzBp8DYhCKlQawG3A=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=P5ABR4OWQM6SgWc3UxJ2qmUL/uKDoQ9tGOfWn6bXMMXAoEUO9g5ZBu+Acb27QSClH
         u8Fk4G9WeLnSNem3RGS0LAdh7xGKaezRHsRRT9j0R3n05BcyQP0UhzYRTR2eG0yHSf
         S1g6Q2K3v000AijT5oT5qBeUZxdZBMySwxEAZ8vgC4CistuTWqq9UktOmfXxCrpjFk
         gemwZeU7VaBODKazfWeml/8bF8tbsvPeWKAIu9ayRRoft8mZOtXQgDqnUKd/UvBio8
         RCux7k1nKumDgqXq8ZCyZpYb7SdtUBSXlMSw/1h3tfBkjuL/5rlfQZBLJp5yKaf1L8
         gCfbj2LDC3cig==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media/dvb/dvbstb.svg: Antena -> Antenna
Message-ID: <f02492bd-8003-f08c-e3da-848a4ee455f7@xs4all.nl>
Date:   Sat, 30 Jan 2021 10:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP6N7fQV1DXpwm5UJV+RvWCbkCI2ou6rhCBh21H58i6rd+2+IX9wa973y37Jpl7LUoBqqG8hCeoD4FYGScqJN6vh/iZIYuWSxaHhikAxmHW3yjk4CfFI
 U34UMuRvn2kufOBrAR/bJvsWI6JNS9KeqmiY3jEyQKwEzCz6JgNaL7S1Ge60xYRlZMv1u4gTaTofRxxjFhECmIu7q9QnWMjcgp0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/dvb/dvbstb.svg b/Documentation/userspace-api/media/dvb/dvbstb.svg
index 87e68baa056b..6f0ba98f9bf9 100644
--- a/Documentation/userspace-api/media/dvb/dvbstb.svg
+++ b/Documentation/userspace-api/media/dvb/dvbstb.svg
@@ -2,7 +2,7 @@
 <!-- SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later -->
 <svg id="svg2" width="15.847cm" height="8.4187cm" fill-rule="evenodd" stroke-linejoin="round" stroke-width="28.222"
preserveAspectRatio="xMidYMid" version="1.2" viewBox="0 0 23770.123 12628.122" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><defs id="defs142"><marker id="Arrow1Lend" overflow="visible" orient="auto"><path
id="path954" transform="matrix(-.8 0 0 -.8 -10 0)" d="m0 0 5-5-17.5 5 17.5 5z" fill-rule="evenodd" stroke="#000"
stroke-width="1pt"/></marker><marker id="marker1243" overflow="visible" orient="auto"><path id="path1241" transform="matrix(-.8 0 0 -.8 -10
0)" d="m0 0 5-5-17.5 5 17.5 5z" fill-rule="evenodd" stroke="#000" stroke-width="1pt"/></marker></defs><metadata
id="metadata519"><rdf:RDF><cc:Work
 rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata><rect id="rect197" class="BoundingBox"
x="5355.1" y="13.122" width="18403" height="9603" fill="none"/><path id="path199" d="m14556 9614.1h-9200v-9600h18400v9600z"
fill="#fff"/><path id="path201" d="m14556 9614.1h-9200v-9600h18400v9600z" fill="none" stroke="#000"/><rect id="rect206" class="BoundingBox"
x="13.122" y="4013.1" width="4544" height="2403" fill="none"/><path id="path208" d="m2285.1 6414.1h-2271v-2400h4541v2400z"
fill="#fff"/><path id="path210" d="m2285.1 6414.1h-2271v-2400h4541v2400z" fill="none" stroke="#000"/><text id="text212" class="TextShape"
x="-2443.8779" y="-4585.8779"><tspan id="tspan214" class="TextParagraph" font-family="sans-serif" font-size="635px" font-weight="400"><tspan
id="tspan216" class="TextPosition"
-x="1281.1219" y="5435.1221"><tspan id="tspan218" fill="#000000">Antena</tspan></tspan></tspan></text>
+x="1013.1317" y="5435.1221"><tspan id="tspan218" fill="#000000">Antenna</tspan></tspan></tspan></text>
 <rect id="rect223" class="BoundingBox" x="6213.1" y="1813.1" width="4544" height="2403" fill="none"/><path id="path225" d="m8485.1
4214.1h-2271v-2400h4541v2400z" fill="#fff"/><path id="path227" d="m8485.1 4214.1h-2271v-2400h4541v2400z" fill="none" stroke="#000"/><text
id="text229" class="TextShape" x="-2443.8779" y="-4585.8779"><tspan id="tspan231" class="TextParagraph" font-family="sans-serif"
font-size="635px" font-weight="400"><tspan id="tspan233" class="TextPosition" x="7217.1221" y="3235.1221"><tspan id="tspan235"
fill="#000000">Frontend</tspan></tspan></tspan></text>
 <rect id="rect240" class="BoundingBox" x="12113" y="1813.1" width="4544" height="2403" fill="none"/><path id="path242" d="m14385
4214.1h-2271v-2400h4541v2400z" fill="#fff"/><path id="path244" d="m14385 4214.1h-2271v-2400h4541v2400z" fill="none" stroke="#000"/><text
id="text246" class="TextShape" x="-2443.8779" y="-4585.8779"><tspan id="tspan248" class="TextParagraph" font-family="sans-serif"
font-size="635px" font-weight="400"><tspan id="tspan250" class="TextPosition" x="13944.122" y="3235.1221"><tspan id="tspan252"
fill="#000000">CA</tspan></tspan></tspan></text>
 <rect id="rect257" class="BoundingBox" x="18113" y="1813.1" width="4544" height="2403" fill="none"/><path id="path259" d="m20385
4214.1h-2271v-2400h4541v2400z" fill="#fff"/><path id="path261" d="m20385 4214.1h-2271v-2400h4541v2400z" fill="none" stroke="#000"/><text
id="text263" class="TextShape" x="-2443.8779" y="-4585.8779"><tspan id="tspan265" class="TextParagraph" font-family="sans-serif"
font-size="635px" font-weight="400"><tspan id="tspan267" class="TextPosition" x="19384.123" y="3235.1221"><tspan id="tspan269"
fill="#000000">Demux</tspan></tspan></tspan></text>
