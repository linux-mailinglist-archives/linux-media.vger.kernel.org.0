Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6209059AA46
	for <lists+linux-media@lfdr.de>; Sat, 20 Aug 2022 02:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245652AbiHTAuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 20:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245633AbiHTAuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 20:50:15 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649E1102290
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 17:50:09 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AF79F6601DC7;
        Sat, 20 Aug 2022 01:50:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660956607;
        bh=+H3Qp4dgu4W/6VRBFibZgzIVcMZdyC1ECe2OVxicSwg=;
        h=From:To:Cc:Subject:Date:From;
        b=TAZDupKJf+dYO3lbyNFNgioUMDyIyiTV4CKu7XyH85uKwCEhJ1rr/vmIpG+CoUBn5
         yp5HXNKBjEQmN68QgzyDzLVqkV1RFNXvz9m5aCYfWE9ApCSlVSCuxIa/crdvnijn5J
         LeSAjc4Hs9/CiasbiepthU5ByzI8/XZ9qYPhW6xJgVdoHu5drOtHx2Ifw9dEa1Wlcw
         osyk3g4E0549s0JDZZD31P6Pkv8dIZSUZjm3mxwfaH4dmJi6DVB6fdr4oLuS7+9QCu
         Fq2IhISDI0vzMxzYrh3GCTRJ0bPfdk2R11FW4MOlJGUrtiTZ79YrC7yJ3txJHcaFGD
         mbU+Lk9n44Gag==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     daniel.almeida@collabora.com, nfraprado@collabora.com,
        nicolas.dufresne@collabora.com, hverkuil-cisco@xs4all.nl,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [RFC 0/2] v4l2 stateless tracer/retracer utilities
Date:   Fri, 19 Aug 2022 17:50:17 -0700
Message-Id: <cover.1660955263.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This project helps to test v4l2 stateless decoder drivers by tracing,
recording and replaying (i.e. "retracing") userspace's interaction with
a stateless decoder driver.

The tracer utility attaches to a userspace application and generates a
json file with relevant system calls, parameters and encoded data.

The retracer utility reads the json-file and makes the same system calls
to a v4l2 stateless driver. Since the retracer is independent from the
original userspace application that was traced, testing can be decoupled
from extraneous factors in the userspace environment. The json-file can
also be edited to inject errors and test a driver's error-handling
abilities.

NOTE:
This project is work in progress and currently only traces VP8, but
H264 and FWHT will follow shortly.

EXAMPLE:
./tracer gst-launch-1.0 -- filesrc location=<some_vp8_file> ! parsebin !
v4l2slvp8dec ! videocodectestsink

./retracer 10284_trace.json

FURTHER INFO AND TEST FILES:
https://gitlab.collabora.com/dbrouwer/v4l2-stateless-tracer-utility/-/tree/main/

Deborah Brouwer (2):
  utils: add stateless tracer utility
  utils: add stateless retracer utility

 configure.ac                    |    6 +
 utils/Makefile.am               |    5 +
 utils/common/v4l2-info.cpp      |    7 +-
 utils/common/v4l2-info.h        |    8 +
 utils/tracer/.gitignore         |    9 +
 utils/tracer/Makefile.am        |   23 +
 utils/tracer/libtracer.cpp      |  217 ++++++
 utils/tracer/libtracer.h        |   92 +++
 utils/tracer/retrace-helper.cpp |  141 ++++
 utils/tracer/retrace-helper.h   |   18 +
 utils/tracer/retrace-vp8.cpp    |  288 ++++++++
 utils/tracer/retrace-vp8.h      |   11 +
 utils/tracer/retracer.cpp       | 1090 +++++++++++++++++++++++++++++++
 utils/tracer/retracer.h         |   24 +
 utils/tracer/trace-helper.cpp   |  218 +++++++
 utils/tracer/trace-info.cpp     |  358 ++++++++++
 utils/tracer/trace-info.h       |   72 ++
 utils/tracer/trace-vp8.cpp      |  183 ++++++
 utils/tracer/trace.cpp          |  520 +++++++++++++++
 utils/tracer/tracer.cpp         |   91 +++
 20 files changed, 3375 insertions(+), 6 deletions(-)
 create mode 100644 utils/tracer/.gitignore
 create mode 100644 utils/tracer/Makefile.am
 create mode 100644 utils/tracer/libtracer.cpp
 create mode 100644 utils/tracer/libtracer.h
 create mode 100755 utils/tracer/retrace-helper.cpp
 create mode 100644 utils/tracer/retrace-helper.h
 create mode 100755 utils/tracer/retrace-vp8.cpp
 create mode 100644 utils/tracer/retrace-vp8.h
 create mode 100755 utils/tracer/retracer.cpp
 create mode 100644 utils/tracer/retracer.h
 create mode 100644 utils/tracer/trace-helper.cpp
 create mode 100644 utils/tracer/trace-info.cpp
 create mode 100644 utils/tracer/trace-info.h
 create mode 100644 utils/tracer/trace-vp8.cpp
 create mode 100644 utils/tracer/trace.cpp
 create mode 100644 utils/tracer/tracer.cpp

-- 
2.37.1

