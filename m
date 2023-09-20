Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2557A82D1
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 15:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236472AbjITNGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 09:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236603AbjITNGQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 09:06:16 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80321110
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 06:06:07 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RrJgc4gD9zyZn;
        Wed, 20 Sep 2023 16:06:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1695215164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7s731bFxnomb/hW4YOABWqNKNou/tihPeQaXzROKkKU=;
        b=j2be7o7XzgfIVf00zTpNaTayiirLyxFJiX1FOcEmhKE94lL57+yB3JyoOLdRtLVDxR8Bdv
        qGGec+WLZOcLuzd+CEl5qjN8I2vjJR91Giocz1l/B4u5UeDtkwmP0OU7xW8I4D1LEy5q8M
        73F6WjvWlbeKua+1VJOEysnXxCCYV20=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1695215164; a=rsa-sha256; cv=none;
        b=WzPPXsrftWg5SLZoJSnZa4i5nEDNePP4P4UlJlZGOFCS0kgw5KzjUbCh6N3/EnoPwKIDHH
        mN1zchaU4BhvtyOXu2a5ejs3Qz1Rr2BBPL2WJQTtNB1DLc03KcJ56ORXR3ZvorOtAMe3jY
        O1kzTU8TsrS06XNHKGzgE9kZhZqQz1I=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1695215164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7s731bFxnomb/hW4YOABWqNKNou/tihPeQaXzROKkKU=;
        b=WFTwLmFkMxkv7G99HwL9Bt1mNUxkU2dRuZPTprieWr/JATrkfC338jysHK4nbAgkeNQ1BQ
        C7atDxTtWKWQ/nH2l/ve6JAOAh0468cUq6in/hw5WQiMj4Wum+/6bxZvBPvXcpDeMFAz6i
        qUYDzgnJKQPoqSF+VA5XOAWDzOvaOWc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 20F40634C93;
        Wed, 20 Sep 2023 16:06:04 +0300 (EEST)
Date:   Wed, 20 Sep 2023 13:06:04 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        Ricardo Ribalda <ricardo@ribalda.com>
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
Message-ID: <ZQruPPVjqbWXAGmL@valkosipuli.retiisi.eu>
References: <20230920125939.1478-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920125939.1478-1-ricardo@ribalda.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thanks for the update.

On Wed, Sep 20, 2023 at 02:59:39PM +0200, Ricardo Ribalda wrote:
> mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
> for long long ints, which result in some compilation errors.
> 
> Lets add some castings and inttypes macros to help the compiler deal with
> this.
> 
> We have to use the castings, because kernel types (__u64 et al) does not
> seem to be compatible with inttypes macros.
> 
> Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>

It'd be great to address this in the kernel. The kernel UAPI integer types
have been around for a very long time so there could be issues in doing
that, too.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
