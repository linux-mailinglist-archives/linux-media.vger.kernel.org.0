Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C6336143E
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 23:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236038AbhDOVj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 17:39:57 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56629 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhDOVj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 17:39:57 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3577C1C0003;
        Thu, 15 Apr 2021 21:39:30 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCHv2 0/2] staging: media: atomisp: cleaning up sh_css.c
Date:   Thu, 15 Apr 2021 17:41:40 -0400
Message-Id: <20210415214142.38974-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following set of patches for sh_css.c aims to resolve coding style
issues and remove redundancies.

Martiros Shakhzadyan (2):
  staging: media: atomisp: Fix sh_css.c brace coding style issues
  staging: media: atomisp: Remove redundant assertions in sh_css.c

 drivers/staging/media/atomisp/pci/sh_css.c | 232 ++++++++-------------
 1 file changed, 90 insertions(+), 142 deletions(-)

-- 
2.31.1

