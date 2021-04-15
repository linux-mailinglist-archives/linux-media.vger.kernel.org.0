Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CC635FF08
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhDOAtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:09 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:48833 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhDOAtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:08 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 15C6620009;
        Thu, 15 Apr 2021 00:48:42 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: cleaning up sh_css.c
Date:   Wed, 14 Apr 2021 20:50:57 -0400
Message-Id: <20210415005106.530914-1-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following set of patches for sh_css.c aims to resolve coding style issues
and remove redundancies.

Martiros Shakhzadyan (9):
  staging: media: atomisp: [1/6] Fix sh_css.c brace coding style issues
  staging: media: atomisp: [2/6] Fix sh_css.c brace coding style issues
  staging: media: atomisp: [3/6] Fix sh_css.c brace coding style issues
  staging: media: atomisp: [4/6] Fix sh_css.c brace coding style issues
  staging: media: atomisp: [5/6] Fix sh_css.c brace coding style issues
  staging: media: atomisp: [6/6] Fix sh_css.c brace coding style issues
  staging: media: atomisp: Use goto instead of return in ia_css_init()
  staging: media: atomisp: [1/2] Remove redundant assertions in sh_css.c
  staging: media: atomisp: [2/2] Remove redundant assertions in sh_css.c

 drivers/staging/media/atomisp/pci/sh_css.c | 266 ++++++++-------------
 1 file changed, 105 insertions(+), 161 deletions(-)

-- 
2.31.1

