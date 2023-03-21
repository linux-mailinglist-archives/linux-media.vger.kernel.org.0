Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E9E6C3C93
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 22:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjCUVVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 17:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjCUVVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 17:21:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BCF4AD16
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 14:21:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A22BB81A37
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 21:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74717C4339B;
        Tue, 21 Mar 2023 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679433692;
        bh=garZWxUSKZ3OIZU/fBlag4OoT0Tu3IxbPrigB3kbjws=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cU31RRY0fx/hEK/gso2x4d/nNBSULSOXJ4ir29DGFRfpzCNIugUXNpVYoIiadQb2g
         QzMpioPy3NXooUptZmR3/+4xheGLu+7T8JmLA08hrBduol7by42jildbY6VD791el7
         5NCMBTKXmJP/S4Ca7HAXxV/w+5gmolwMr4PSXu4TU6R50WciYUiJeLf3cY8kkl/umn
         Obd8cliumzeURyNicRidW0D4NB8Xa3lqSZy4K2CGJl5EErzKjJZX5LjTCjz9Xu2ajI
         RheJppRhT2r8Z9nlrZedg3AA/RM4VZmZ6uplEuDbZP3EL4fPHDp8ncesJU/bWQ7nDy
         goi9YUzs4cY0w==
Date:   Tue, 21 Mar 2023 22:21:26 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Young <sean@mess.org>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: v4l-utils 1.24.0 has been released
Message-ID: <20230321222126.2490de9b@coco.lan>
In-Reply-To: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
References: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

Em Thu, 23 Feb 2023 10:44:41 +0100
Gregor Jasny <gjasny@googlemail.com> escreveu:

> Hello,
> 
> I'm happy to announce that v4l-utils 1.24.0 has been released. This will 
> be the last version before the build system will be migrated from 
> Autotools to Meson.
> 
> Changelog: 
> https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=v4l-utils-1.24.0
> Download: https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.24.0.tar.bz2

I wouldn't mind if we would have a shorter release time for version
1.26 - or maybe it is time to increase major, so version 2.0.

As we are now using a new building system, it would be nice to have
a stable version frozen, with not much other changes, in order
to allow distros to opt either to use version 1.24 with autotools
or to migrate to the newest version, with meson, but not many other
changes.

So, perhaps we should aim release a new version in 2 months or
so, once we have enough time to do cleanups if needed and having
media maintainers and developers familiar with the new way.

Comments?

PS.: on that matter, I took ahead and changed Fedora rawhide
v4l2-utils package to use the new building system:

	https://bodhi.fedoraproject.org/updates/FEDORA-2023-43964d4d83

That helped to identify a bug after the migration at the man page
location, and hopefully would help to have more tests on a more
realistic scenario (e. g. after packaged on distributions).

Thanks,
Mauro
