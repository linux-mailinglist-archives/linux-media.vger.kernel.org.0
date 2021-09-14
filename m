Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998B340AD5E
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbhINMUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:20:01 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:43889 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232644AbhINMT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:19:58 -0400
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id PpJUmKtuFczbLQ7Hhmm22d; Tue, 14 Sep 2021 12:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631621493; bh=eSZBmfR7iMhmYMt/uRP2guSSw/SqR7cPD/XEmYdVEaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=sTJFjSegR8leu1kYV+QzaVgHOuRXyeFzHeQtzcyxC4ThNZWnS+ceoHa1o4H4YfMW/
         atEERGxRkn/JtlssP63byajY1gBhSLbINfPz2I6d5rpgS9nUPC3LQydr8CaWvxtFac
         o872uY+o0vjAmgSxHzdtRM1W3aHElSRC2RY0oh+4OgJR1mjWLsI/vzrJFFzHLlQzBU
         IekFrHQrmyopo6adW8HmaXozex0/YDXFBWguSUolhBj3LcW3bOEKU1RBtcwvaHOqA3
         NrqeokqfX5C6aSDOnbqW3B12aXE0pZswMsUbB28RIF+kso5WVq1a80jFLYun60jx/0
         dZlseFMo/4ZVw==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id Q7Hdmcu7dcHSBQ7Hgmpv0S; Tue, 14 Sep 2021 12:11:33 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=I4EG+Psg c=1 sm=1 tr=0 ts=61409175
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17 a=_Dj-zB-qAAAA:8
 a=iSQrim1fHST801TFj4cA:9 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 03/11] edid-decode: change install directories for macOS
Date:   Tue, 14 Sep 2021 05:11:21 -0700
Message-Id: <20210914121129.51451-4-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210914121129.51451-1-joevt@shaw.ca>
References: <20210914121129.51451-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMzUkSJUL90VP3BDFNNJwYbXNjPfWwfLrZEjJBQ1KqkE6go3lBDfGxVvb5td5ujMdyseqfVfjwp6b4AaIOkpC7Le+JvooqR0lCKSH1a/PohxzrDb246T
 dISicgkp2fmoBg3YHiH0F9QGKISDeB1lRRyKxoSE1Sofq3KVAAhcs1H94qKv0jnQkN81kGAhamOSRvovMJJJHm26RtjqpPXmLYQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In macOS, /usr/bin and /usr/share/man belong to root:wheel so install to /usr/local/bin and /usr/local/share/man instead.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 Makefile | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 287b72d..adf6123 100644
--- a/Makefile
+++ b/Makefile
@@ -1,11 +1,23 @@
-bindir ?= /usr/bin
-mandir ?= /usr/share/man
+ifeq ($(OS),Windows_NT)
+	bindir ?= /usr/bin
+	mandir ?= /usr/share/man
+else
+	UNAME_S := $(shell uname -s)
+	ifeq ($(UNAME_S),Darwin)
+		bindir ?= /usr/local/sbin
+		mandir ?= /usr/local/share/man
+	else
+		bindir ?= /usr/bin
+		mandir ?= /usr/share/man
+	endif
+endif
 
 EMXX ?= em++
 
-SOURCES = edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
-	  parse-displayid-block.cpp parse-ls-ext-block.cpp \
-	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
+SOURCES = \
+	edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
+	parse-displayid-block.cpp parse-ls-ext-block.cpp \
+	parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
 WARN_FLAGS = -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter
 
 all: edid-decode
-- 
2.24.3 (Apple Git-128)

