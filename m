Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150DA337110
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 12:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbhCKLUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 06:20:36 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39245 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232562AbhCKLUW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 06:20:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KJMYlPwA1C40pKJMblL8I1; Thu, 11 Mar 2021 12:20:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615461621; bh=5JbLRe2zSfU3f2F80YwLpYmJitj3aD13U35UNOhgXtI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MCnOfZTegTH+RpEkbvNcIeJlEllknZLGxhMnvqWdlSdSJZ3p3NqD+SE7YMiRO/K4L
         IP89Vs/Y/GsFquNsiGfKsMD3dld+rKR9bYqgwsLc0OLWQCGln6xDz1jzjIn91yRIGX
         MOlfYEMZlKukXiHfd/mdqsv0MN30rK5oJkZHDirQlIupR7HopBcVT63UuZcylJ0wsW
         /4jVmEraLco3QJk+Ofuhf+eQaOrl5p2LnmHKpQKu6vejWpBU4mY2cjExFNQjLteAK9
         zeprOJLS4PZicvXr/I9lWcHMrf1j2tCIUFQpj6JWczXZGOn99Ox42LdtT6QipBCx7C
         kATlzxcHUiPFg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/usb/gspca/w996Xcf.c: /** -> /*
Message-ID: <2b95113e-6e4f-44a5-bf05-31015cf02b25@xs4all.nl>
Date:   Thu, 11 Mar 2021 12:20:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfA9t9I2Rgs4JjH745UGuMi5VcW3kwJ6d2fpiXwV0x3U+kNzvQ29cSE+wFFvQd8HzUehp2MGpvD6toXDErsotgYiy23VM6myJOh+hJEQX9aI1JS+DEMOe
 u5aywUxXcnUd5zNZI/D43NxO9YBJ1BgUaDNXiEXui5SGSBhTCrf4+dePBCUYkYg/+EB4qDCoQ6zk2L/G8npnVPA/PbM0jEIW/mQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The copyright text is just a comment, not kernel-doc documentation.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/gspca/w996Xcf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/w996Xcf.c b/drivers/media/usb/gspca/w996Xcf.c
index a8350ee9712f..79baa0c1a031 100644
--- a/drivers/media/usb/gspca/w996Xcf.c
+++ b/drivers/media/usb/gspca/w996Xcf.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/**
- *
+/*
  * GSPCA sub driver for W996[78]CF JPEG USB Dual Mode Camera Chip.
  *
  * Copyright (C) 2009 Hans de Goede <hdegoede@redhat.com>
-- 
2.30.1

