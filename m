Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D73C355919
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 18:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346371AbhDFQXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 12:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbhDFQXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 12:23:31 -0400
X-Greylist: delayed 1134 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Apr 2021 09:23:23 PDT
Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu [IPv6:2a00:1398:9:f712::810d:e752])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D71C06174A
        for <linux-media@vger.kernel.org>; Tue,  6 Apr 2021 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kit.edu;
        s=20190212; h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
        Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=fbjM4hf2QketAOkBXeTui9DgzPvGyS3aT2uK+YRA/c8=; b=5p4yrSdcGBD1GRmrEw3/uJVV71
        UvcfmBJjyqWCZEGtmJqONReYvSa7SjRPjJvMxOMLNzhY1U8QjBNbMGdCe4c3EYl6/Frffqj5jxWem
        nr7HR5koubwROsnhur9TCYEEab81AyVEVBl4+nDZvMLHhxzKT7BXDmS5jjiVrvwBkOyI=;
Received: from kit-msx-46.kit.edu ([2a00:1398:9:f612::146])
        by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (envelope-from <daniel.bacher@kit.edu>)
        id 1lToBl-0004Tc-JY
        for linux-media@vger.kernel.org; Tue, 06 Apr 2021 18:04:27 +0200
Received: from kit-msx-51.kit.edu (2a00:1398:9:f612::151) by
 kit-msx-46.kit.edu (2a00:1398:9:f612::146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 6 Apr 2021 18:04:25 +0200
Received: from kit-msx-51.kit.edu ([fe80::ec99:94a8:b93c:7ef4]) by
 kit-msx-51.kit.edu ([fe80::ec99:94a8:b93c:7ef4%5]) with mapi id
 15.02.0792.010; Tue, 6 Apr 2021 18:04:25 +0200
From:   "Bacher, Daniel (IAI)" <daniel.bacher@kit.edu>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Support for EM28281
Thread-Topic: Support for EM28281
Thread-Index: AQHXKv6D+L7FBqo0mEOkjAFL+hhOjw==
Date:   Tue, 6 Apr 2021 16:04:25 +0000
Message-ID: <AA59BE1B-6ED6-4F36-ADBD-9E40E8BB874F@kit.edu>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-originating-ip: [2a00:1398:9:fb01:2890:e31e:3cc6:8ade]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E23091BF435E343A81D94DCCE6BF3FA@kit.edu>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
I have a Startech framegrabber (SVID2USB232) which has the chip EM28281.=20
I would like to adapt the module EM28xx so that this chip can be used with =
Linux. However, I do not know how to proceed.

What I have found out so far:
Type: EM28281
Data sheet: http://standwell.cn/Uploadfiles/20151022154755309.pdf
USB ID: eb1a:8286

Can someone help me with this?

Greetings

Daniel Bacher=
