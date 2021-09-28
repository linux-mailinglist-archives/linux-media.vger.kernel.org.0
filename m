Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D0F41AD22
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 12:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240187AbhI1KkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 06:40:16 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:40293 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240161AbhI1KkQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 06:40:16 -0400
Received: from shw-obgw-4004a.ext.cloudfilter.net ([10.228.9.227])
        by cmsmtp with ESMTP
        id UwjamiW1JczbLVAVQmcz27; Tue, 28 Sep 2021 10:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1632825516; bh=Zr/GomDxppbTzzptIEh8LW+qwfa9zxDT5ZlGAZT1WhU=;
        h=From:To:Cc:Subject:Date;
        b=mkMXfjzYqbUSj+RHIFmxCrUmc1CBb00aHREOyoW52Z4T5/7jNqCsapGtWE6MyN0m5
         vy0ujnwcgwJsqQLdPX1vWQqUl9Sb54iNHx1qTSsOZwvf2NdHD1zizvyI5rYLftCYrN
         jRSfUrnE/qA8dL8lQCczFPBkBho8n4Vn29pVpyDkw0Hn8RsXJMh7TJACuxpazdY3Cg
         eU5A3ejAmsoFivmGL6aU+yxT7vYjIyo8kREkaToa2XVmf96b+zbQjZTeuAoRH19YPl
         yoqeIOUZzNyMX5fVRyTIH4yVmZkSyJyuql5gw3i54OHqnd7Cb2fu4feaa9sYeFDf30
         5vzLTKFQdLM1A==
Received: from shaw.ca ([70.71.78.228])
        by cmsmtp with ESMTPA
        id VAVOm7MUwdCHGVAVPmF4AK; Tue, 28 Sep 2021 10:38:36 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=SdyUytdu c=1 sm=1 tr=0 ts=6152f0ac
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=iYyjgUWRv5lsHnploQIA:9
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 0/2] edid-decode: corrections
Date:   Tue, 28 Sep 2021 03:38:32 -0700
Message-Id: <20210928103834.2186-1-joevt@shaw.ca>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD9hOCLDCCWdq6RcTGDNn5bX8EDrdsMnfu+PuCP3KSGth/3oGaNVy0xGsR18tooCqQPhBw0fhuHgrb3PMNBZzM8g9+NkgU4NsGgHI4qSH5oeIChdG8+I
 /iLf8AWfXKJv7DykUnrUiFwxsprFiYLUAChCiCxt+/d/ueCjMEnyftb4UGlq7kvPzo+QZmJsR0vDXKPtioU21sJd460+UWxToHo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These two changes are in response to the last two commits:
- report length for unknown data blocks
- fix reporting PNP as a proper PNP

joevt (2):
  edid-decode: fix pnp and oui
  edid-decode: output correct unknown block length

 edid-decode.cpp           |  4 +++-
 oui.h                     |  2 +-
 parse-displayid-block.cpp | 10 +++++-----
 3 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.24.3 (Apple Git-128)

