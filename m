Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F548282BD8
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 18:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgJDQnC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 12:43:02 -0400
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com ([46.30.210.184]:49672
        "EHLO mailrelay3-1.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726077AbgJDQnC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Oct 2020 12:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wedl.one; s=20191106;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
         message-id:references:to:from:subject:from;
        bh=YsWommNeCZA/BCM1jUJ6ohR3pB9eWoz//Yds422JWR8=;
        b=AtyHjQYhBMlg2XPXA0gD0UWeWTzCVykjmLVGCEFawufDei/N3oYZok/Z29o2iMsSWPBYBc2suMK2P
         6yEzkRVAujGpz4goNDVtiO8jzVNewShIBAWDD4wRrIiXvZaeAcPFIhnGpbcT97rpr0rnxjNGAYYlMh
         ItIS00H5WZ68oF97CdHHO+arfq9lYRGIN30X06C+FaE6rdFsu3PmtAAd6TyEsmUR11kLdceTvW8ma1
         1eWLdj1YXSEFRGgpeWt8QHJjMWXRTu0m6WxEuPEh4euGpEN95a5Ysd3gdf6Z0thAEjfts5jelsA6Sk
         mOy4rMjfO8F32Xl5egnx6irA4SUVQYw==
X-HalOne-Cookie: 51ee2edaba552be41cb0d3579cff60ed1b0d7b82
X-HalOne-ID: a9193504-0660-11eb-a800-d0431ea8bb03
Received: from [172.16.1.8] (dyndsl-091-096-130-080.ewe-ip-backbone.de [91.96.130.80])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id a9193504-0660-11eb-a800-d0431ea8bb03;
        Sun, 04 Oct 2020 16:42:59 +0000 (UTC)
Subject: Maxim MAX3543 DVB Tuner
From:   Webmaster <webmaster@wedl.one>
To:     linux-media@vger.kernel.org
References: <eddb42fa-889c-6653-3db3-113d05350c28@wedl.one>
Message-ID: <c3fd2bf2-dc5d-105d-1ecb-91b2f97a0c00@wedl.one>
Date:   Sun, 4 Oct 2020 18:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eddb42fa-889c-6653-3db3-113d05350c28@wedl.one>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Is it possible to get the DVB tuner MAX3543 to work in the current kernel?

https://www.maximintegrated.com/en/products/comms/wireless-rf/MAX3543.html

There were drivers for the 3.0.0 and 3.2.0 kernels

https://github.com/ambrosa/DVB-Realtek-RTL2832U-2.2.2-10tuner-mod_kernel-3.0.0

Unfortunately, I have no experience with driver programming.

I can test with 2 USB devices with MAX3543 RTL2840 RTL2832P X7251M50 inside

Ingo



