Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A68087E2684
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 15:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjKFOVe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 09:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjKFOVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 09:21:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3A6F4
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 06:21:31 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B919C433C8;
        Mon,  6 Nov 2023 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699280490;
        bh=h/hs4y/k5XI7fZZ8E2gk6/tkZfRFuZxoWeZw0Ywyb9M=;
        h=Date:From:To:Subject:From;
        b=tpY/faUy7UFidOyyvoWeaQEoYt4Ewve6FqMP/EeaBxrh1RyohjUEJN2/fA09uoxNA
         iiaBkQD43mXJPWszs/hAmws4j8lyjBSYPlWqb2AUbWVFXvnh/gaVrpyfJd1Ystddsc
         H9HOKwVCyY2MdiI46xoXVYk3gAHIh5B7MxDkA7jI=
Date:   Mon, 6 Nov 2023 09:21:29 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-media@vger.kernel.org
Subject: PSA: migrating linux-media to new vger infrastructure
Message-ID: <20231106-aquamarine-kittiwake-of-freedom-f1f7fb@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good day!

I plan to migrate the linux-media@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
