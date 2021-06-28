Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D563B5A6A
	for <lists+linux-media@lfdr.de>; Mon, 28 Jun 2021 10:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbhF1I0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Jun 2021 04:26:19 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35413 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232308AbhF1I0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Jun 2021 04:26:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xmYXl39zV1vOAxmYal9P8I; Mon, 28 Jun 2021 10:23:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624868632; bh=09O7K7B8D8tlgC/UprXm/hppB1ltXlfQa1gCvp9T13U=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=o1ZDOuifKeFSvOThzRjRJ4HAKIoxSOQ7e4YnUbaj8GoYH6+jtvYx/6W8394SnB1BJ
         6ngO22JecsZ4b0fcFm9LKkBqhUhwpLrQ5ED6FiI5HH1W7+XxAT98b77F2s0j8Ws+xF
         p4Jv+6+hPQVOXbYOUrwULqPVb8AIDyxW4XlKgMq2q726+qfet4JCgkkb1c2NBp0FIT
         Abp7nOFlNA7HNjT8VVqux3t5bnkK6A7lzz05iBrAjWqVvn++pbE0ItZLtObgUrq0Gx
         ouDPb2GAnP2CsVp/uFCugBaGicZiTqQIhHkqE48MFWxGQ5Ycvj5RJ9uINhZvY/yGKk
         IgCu9KaZ+RBdQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/cec-core.rst: update adap_enable doc
Message-ID: <b41898e6-f1e2-1656-7963-f85f1ec5fad5@xs4all.nl>
Date:   Mon, 28 Jun 2021 10:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCtImwniYImChHd+xqItP7+1LKzZsNV3HvpbOqWr3gIVqvNJ441sg2lRaENkeS90EhWtAoW6nCqDmp9EpNJY09TcgE8+eqT3bH8SuAhB0fijDXjr9XXH
 3rbOW6h1vi/+gGhn4XRRDGYwwnIo4kQfherIXRaOmRpWlbK64UrzVC51DDyFG34yvPP2VtuNWBS+36u/R6Vb5C0/2wMmrw/3NhI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The description of adap_enable was out-of-date. Improve it so that it
corresponds to what really happens.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index 56345eae9a26..c6194ee81c41 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -130,9 +130,12 @@ To enable/disable the hardware::
 	int (*adap_enable)(struct cec_adapter *adap, bool enable);

 This callback enables or disables the CEC hardware. Enabling the CEC hardware
-means powering it up in a state where no logical addresses are claimed. This
-op assumes that the physical address (adap->phys_addr) is valid when enable is
-true and will not change while the CEC adapter remains enabled. The initial
+means powering it up in a state where no logical addresses are claimed. The
+physical address will always be valid if CEC_CAP_NEEDS_HPD is set. If that
+capability is not set, then the physical address can change while the CEC
+hardware is enabled. CEC drivers should not set CEC_CAP_NEEDS_HPD unless
+the hardware design requires that as this will make it impossible to wake
+up displays that pull the HPD low when in standby mode.  The initial
 state of the CEC adapter after calling cec_allocate_adapter() is disabled.

 Note that adap_enable must return 0 if enable is false.
