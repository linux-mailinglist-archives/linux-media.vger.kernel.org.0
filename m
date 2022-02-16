Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 408624B8563
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 11:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbiBPKSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 05:18:48 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:42604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbiBPKSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 05:18:48 -0500
Received: from frolo.macqel.be (smtp2.macqel.be [109.135.2.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05D8A24BE1
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 02:18:34 -0800 (PST)
Received: by frolo.macqel.be (Postfix, from userid 1000)
        id 98E07BF424C; Wed, 16 Feb 2022 11:18:33 +0100 (CET)
Date:   Wed, 16 Feb 2022 11:18:33 +0100
From:   Philippe De Muyter <phdm@macq.eu>
To:     linux-media@vger.kernel.org
Subject: Re: FAILURE of git clone http://git.linuxtv.org/v4l-utils.git
Message-ID: <20220216101833.GA1383@frolo.macqel>
References: <20220216085841.GA27156@frolo.macqel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216085841.GA27156@frolo.macqel>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replying to myself :

I needed to install newer versions of the ca-certificate package
on my machines :)

Sorry for the noise

Philippe

On Wed, Feb 16, 2022 at 09:58:41AM +0100, Philippe De Muyter wrote:
> Hello
> 
> I just noticed that cloning the v4l-utils git repo at linuxtv.org
> doesn't work anymore :
> 
> Here are different views of the problem :
> 
> on ubuntu-18 :
> nvidia@cam5-jp43-1:~$ git clone http://git.linuxtv.org/v4l-utils.git
> Cloning into 'v4l-utils'...
> fatal: unable to access 'http://git.linuxtv.org/v4l-utils.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
> nvidia@cam5-jp43-1:~$
> 
> on opensuse 13.1 :
> phdm@dyn223:~> git clone http://git.linuxtv.org/v4l-utils.git
> Cloning into 'v4l-utils'...
> fatal: unable to access 'https://git.linuxtv.org/v4l-utils.git/': SSL certificate problem: certificate has expired
> phdm@dyn223:~>
> 
> Best regards
> 
> Philippe
