Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15FFE329E
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 14:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502057AbfJXMnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 08:43:03 -0400
Received: from gofer.mess.org ([88.97.38.141]:52675 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729411AbfJXMnD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 08:43:03 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 98DE511A001; Thu, 24 Oct 2019 13:43:01 +0100 (BST)
Date:   Thu, 24 Oct 2019 13:43:01 +0100
From:   Sean Young <sean@mess.org>
To:     Gregor Jasny <gjasny@googlemail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: v4l-utils.spec.in out of date?
Message-ID: <20191024124301.GA18559@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor, Mauro,

The v4l-utils.spec.in file in the v4l-utils git repo looks like an out of
date version of this file:

https://src.fedoraproject.org/rpms/v4l-utils/blob/master/f/v4l-utils.spec

Now I have some changes to go into this file. However patching an old
version does not seem to make sense.

https://patchwork.linuxtv.org/patch/59602/

How should I proceed from here?

Thanks,
Sean
