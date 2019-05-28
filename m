Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8572C2B9
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 11:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfE1JHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 05:07:53 -0400
Received: from shell.v3.sk ([90.176.6.54]:36868 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbfE1JHx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 05:07:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id C1BCF1048A3;
        Tue, 28 May 2019 11:07:49 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Rcdu8pR--4nw; Tue, 28 May 2019 11:07:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id C08E71048AD;
        Tue, 28 May 2019 11:07:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id QEghzfZrVEQB; Tue, 28 May 2019 11:07:34 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id D75CD10489D;
        Tue, 28 May 2019 11:07:33 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/7] media: make Marvell camera work on DT-based OLPC XO-1.75
Date:   Tue, 28 May 2019 11:07:24 +0200
Message-Id: <20190528090731.10341-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is a re-send of the patch that lacked a Signed-off-by tag and the
patches that followd it in the previosu spin of the series.

Applies on top of master branch of git://linuxtv.org/media_tree.git

Cheers,
Lubo



