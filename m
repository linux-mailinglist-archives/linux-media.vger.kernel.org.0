Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FDC41875C
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbhIZIfJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:35:09 -0400
Received: from omta002.cacentral1.a.cloudfilter.net ([3.97.99.33]:39161 "EHLO
        omta002.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229574AbhIZIfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:35:08 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id U6LtmGvqbps7PUPbImzSGg; Sun, 26 Sep 2021 08:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632645212; bh=Mkg+GCSYsSnciL68UVjFtP1sBc1Y/KxIcQK8ksuCn7s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WX3eevdvCPsm++LhileEdAYsoKxbck0tZFP0lEPvTxhO7ZOWRNhMZmUOwUa1mcNl+
         24gJY+ulJ1XaAL68TrDmkaTslDEr9Pe6anwpzRv6XFPZRHRZ8sGfvQP/V9ZiLEn7xU
         HOG8y2eXSnJNQjMQsou3Dob46V9csx0u2aeuoulewPApgAl3Rdv8BJFiaFlpe05ipP
         cHR/UyFcugX6RM3wDgk7bhToKT+coU6TegOCxuIa6M4dPxS5VIVoeC55QakuoNW/jx
         kVhqgXRLMTGnvLnfa9V+xppSOEzqcUfhNNtMc2fsL6CSEm4u2HqH+m8rLsk0pbbiZ0
         4a1dyyDIWqn7Q==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id UPbGmpVUmdCHGUPbIm6iEA; Sun, 26 Sep 2021 08:33:32 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6150305c
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=2mh5z2ImN-xkmkKSv0IA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH v2 01/29] edid-decode: remove unnecessary length check
Date:   Sun, 26 Sep 2021 01:33:02 -0700
Message-Id: <20210926083330.5206-2-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210926083330.5206-1-joevt@shaw.ca>
References: <20210926083330.5206-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCwsqoQToehvrwTgF2jkvt73Ak5WocNz1xLu1j8a9055jJ5AiZFhJ+ZZZZRktTUtxEV04TjMvqifMZDXR337K24pFGhQfbG1qUjy22BR0HI4McHEFp4N
 AKsavrqRiySDbX4h+HXUvVTdCG7v6ZI/NMIdQR2/id59D7R3V+TRGM8hVtQRZj0v3eCIp1u6HFtxZ4CprM7Xtwu29n199GicNbU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The for loop also checks the length. Nothing will happen if length is zero as expected.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.cpp | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/edid-decode.cpp b/edid-decode.cpp
index d5062dd..d77646d 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -700,9 +700,6 @@ void hex_block(const char *prefix, const unsigned char *x,
 {
 	unsigned i, j;
 
-	if (!length)
-		return;
-
 	for (i = 0; i < length; i += step) {
 		unsigned len = min(step, length - i);
 
-- 
2.24.3 (Apple Git-128)

