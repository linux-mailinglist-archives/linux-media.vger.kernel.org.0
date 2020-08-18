Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DB22485EE
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 15:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHRNTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 09:19:34 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33813 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726570AbgHRNT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 09:19:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 81WKktNaLywL581WLkUlUo; Tue, 18 Aug 2020 15:19:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597756762; bh=tJPHsQt2wXm0OY92hSjphuoQGEHb/mVCdkIGKpJyFU4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RtttJH7aT4Ts38fR456GFSFIs7iUhLc0CIKkwJ+7qhV+sWjGOgogWs5MdKLFwX1A4
         q2SRRiXelD1Pg0J0Q1mPE4kDNhwBk5tl/RuzEY+QRDAM3ubIVwAu+z5eQpstaUnqvC
         NeHtlNLFC0cJ/dY8qxAND4pDAUl1peobYoIRl+tXkgxssyxkjX+ZfTpk5cZUz7DtrJ
         YSTLYkorPd6RILA3kPUkh3klQo/KFhh7NXr20RwDdQfnDcISxtYFrYE3XWVvOe1B3G
         pc4XPtZJ36JBXElJ21Uq+u3UFxx3xYlA8hKY7Y+M6mI+feYVqqvRKLl3BQSWpJRrY/
         6lkjUbkLIoVhw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] dev-sliced-vbi.rst: fix wrong type
Message-ID: <5cebed82-2e36-b773-0650-b133bf49009e@xs4all.nl>
Date:   Tue, 18 Aug 2020 15:19:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEMe+7XgLFjxPTpJ5Dd87l4yD2Nqf2TOsNTsjYf8UoVdDGVaVSnGRX4CjlOV/aMK1tIpLAh++T15DVctgczijHNEYH2bPFTm/MYHoMj5eq/Ol6oFqTAy
 09bQD1fv8i/CIxd3GC/6NqiiqaV2LQmdAGc2cmGVXhok/S+EJA/fysMvRwb2+HcSmMKpI58WQnzqZpzuWe862X+Uhs3RuxRvaM4t3N1ae6oL0vUHf/nvvGNw
 7afJ0Nkh1mLHC6KipFCT/lZxlCNmEEjc8sDYDjyXs0w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The documentation reported service_set as a __u32, but according to videodev2.h
it is a __u16. Correct the documentation.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index dd0b6646beb5..bd517e82c895 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -127,7 +127,7 @@ struct v4l2_sliced_vbi_format
     :stub-columns: 0
     :widths:       3 3 2 2 2

-    * - __u32
+    * - __u16
       - ``service_set``
       - :cspan:`2`

