Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E22E25CC68
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 11:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfGBJIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 05:08:06 -0400
Received: from gofer.mess.org ([88.97.38.141]:39455 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbfGBJIG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 05:08:06 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F36C260A67; Tue,  2 Jul 2019 10:08:04 +0100 (BST)
Date:   Tue, 2 Jul 2019 10:08:04 +0100
From:   Sean Young <sean@mess.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] keytable: Remove comments before processing keymaps
Message-ID: <20190702090804.lhxll6g7l6bdlmll@gofer.mess.org>
References: <20190701163813.25032-1-hadess@hadess.net>
 <20190701163813.25032-2-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701163813.25032-2-hadess@hadess.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 01, 2019 at 06:38:13PM +0200, Bastien Nocera wrote:
> Do our best to remove comments from each line we process from the keymap
> sources, so as to avoid commented duplicates and false positives
> sneaking in to the keymap definitions.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  utils/keytable/gen_keytables.pl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/utils/keytable/gen_keytables.pl b/utils/keytable/gen_keytables.pl
> index 3dc74ba6..d73daf58 100755
> --- a/utils/keytable/gen_keytables.pl
> +++ b/utils/keytable/gen_keytables.pl
> @@ -138,6 +138,9 @@ sub parse_file($$)
>  		}
>  
>  		if ($read) {
> +			# Remove comments
> +			~ s#/\*.*?\*/##sg;
> +			~ s#.*\*/##sg;

This doesn't solve the

	/* { 0x800ff40b, KEY_ENTER },
	   not used */

case. Or // comments.

>  			if (m/(0x[\dA-Fa-f]+)[\s\,]+(KEY|BTN)(\_[^\s\,\}]+)/) {
>  				$out .= "$1 = \"$2$3\"\n";
>  				next;
> -- 
> 2.21.0
