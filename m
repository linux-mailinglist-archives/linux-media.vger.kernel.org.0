Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45111260CB8
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 09:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729645AbgIHH6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 03:58:31 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35875 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729967AbgIHH6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 03:58:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FYVpkW6DSMeQuFYVqkf58V; Tue, 08 Sep 2020 09:57:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599551879; bh=dVku8uiYp3m2iW06dE5tACg/FXorq5zXxr2IfpVIiR0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vadgd+1vp3jxmrLkfVTQ+uU3rNNfV5ENm7oxFJSywiHk05bYDO7Q3hLpYgJixS4oW
         N/Vgd7TTVDgNB+x1M2+mA0gv8/m5cCflD18FloNNLPsbmznxKO86y9tCvWktEN2b6Q
         CVZukNz6dZwRQhipcOP9sscYpZ3PtPGzoEUSspWMcaRpDfPcUuomEdGVaCa29JSlwk
         RutmWvnCcPQjFyDLE3nR77XYC/AsGUvGfReSbwyyeScFSFi2KOkL1I79lvD8qUqeKQ
         IZbLAoIOmMaEktu5CAP4/o2AeGa6AXhWwAQxkcQo7qSM0ATZjTQbrOB97TiZfYf0E4
         T8csOpERNvRfw==
Subject: Re: Asus PN50 CEC
To:     Timo Ketola <timo@riihineva.no-ip.org>, linux-media@vger.kernel.org
References: <e56fb2cd-5e40-b83e-f702-0dced9df86fb@riihineva.no-ip.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8634e5af-175d-1fff-1693-1445f336b9f9@xs4all.nl>
Date:   Tue, 8 Sep 2020 09:57:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e56fb2cd-5e40-b83e-f702-0dced9df86fb@riihineva.no-ip.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHXgvw4BFJVf909uv/DGiz4Ss3Zf6375CzpW+4pJtE5uF2u7fX4cZWn9jAF7wY8xPsfMkZaAoMhruRAzv3djQckTEcCMaYtt+mpOuiHSPz8VvBvMveSj
 YdtCUlG8EgBE/KhTwPYc32OTmtqSsdNqH7+XQCphWDSyLbO2qjlDiZhmy96K4VpZyFRxtfonxJesfVA6M7j3Rn98VEViXtqLKvrHtB1pd5HdK2dx9B59Mf/r
 EWZREJVfs3DniF82NQ6IsZc4RZZg33D4W8JnjV6NGCw3/T6eNJSUiWZ7bPi8mwmcm9ZdaKeSFuC9TtX+f8jVKA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/09/2020 21:49, Timo Ketola wrote:
> Hi all,
> 
> I'm not sure  weather this is the right place to ask but one has to start somewhere. Here we go:
> 
> I bought an Asus PN50 mini PC (Ryzen 3 4300U). It should have HDMI-CEC and there indeed are some related settings in the BIOS. But there seems to be no support for it in Linux and I can't find any
> hints how it might have been implemented on the hardware side.
> 
> Any ideas what to do now?

I suspect that this is a BIOS-only implementation that just does the bare minimum
for wake up and standby (if enabled).

Similar to what Intel did on some of their NUCs.

Not very useful since it can't be accessed from the OS.

That said, I can't really find any good information on it since I could only
find a Quick Start manual that had no information on this.

Regards,

	Hans
