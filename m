Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176603A4FC4
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 18:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhFLQp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 12:45:28 -0400
Received: from ip-8.mailobj.net ([213.182.54.8]:50244 "EHLO msg-3.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhFLQp1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 12:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1623516197; bh=d6LIR7S6jjI4mXqkbA62IUweHEQazYbPtmR/339Qqy8=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=ccEujJsiJmKalL+PkWprn1KGuUE/5JjZJ517oFOLXJiXUN/oQD0RcqqDouJIiocel
         TIHm1JxZnX+502pwnbekcy8ixg/f8IfNiLHh43JHb3RAkBOxKs1/yXwDf1gTfwH3Fq
         mgas4guf7lFQ5CHaHr/pmZdfYnoE/eWJLOJVDVAY=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 12 Jun 2021 18:43:17 +0200 (CEST)
X-EA-Auth: A6puxyQLIT2Pr7uBw7qahIRUTGef5g/z72HejE2fnSHmsiJrz0fX37wzQ+FL86Yar2uMGMtCAwVuC8VYABDaFcJSXxb0nJyX
Date:   Sat, 12 Jun 2021 22:13:12 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] staging: media: atomisp: code formatting
 changes
Message-ID: <YMTkIFIDHPdzrPcl@dU2104>
References: <cover.1619850663.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619850663.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 21, 2021 at 12:30:41AM +0530, Deepak R Varma wrote:
> This patch set overall improves the code organisation and readability of
> the files of atomisp drivers. There are several complaints reported by
> checkpatch including ERROR and WARNING types on the files under atomisp/pci
> directory.
> 
> The changes are proposed on a per file basis since there are many
> issues to be addressed in each individual file. The patches are built
> on the media_tree/for-v5.14-out1 tree/branch.

Hi All,
I have only received one comment on one of the patch of this patch set. I
have not seen any comment or ack on the other patches.

Will you review and share feedback on the patches please.

Thank you,
deepak.

> 
> 
> Deepak R Varma (5):
>   staging: media: atomisp: code formatting changes atomisp_csi2.c
>   staging: media: atomisp: code formatting changes sh_css_mipi.c
>   staging: media: atomisp: code formatting changes sh_css_params.c
>   staging: media: atomisp: code formatting changes sh_css_sp.c
>   staging: media: atomisp: code formatting changes sh_css_version.c
> 
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  72 +-
>  .../staging/media/atomisp/pci/sh_css_mipi.c   | 170 ++--
>  .../staging/media/atomisp/pci/sh_css_params.c | 929 +++++++++---------
>  drivers/staging/media/atomisp/pci/sh_css_sp.c | 471 ++++-----
>  .../media/atomisp/pci/sh_css_version.c        |   4 +-
>  5 files changed, 754 insertions(+), 892 deletions(-)
> 
> -- 
> 2.30.2
> 


