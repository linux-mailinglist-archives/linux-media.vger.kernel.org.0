Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834622B2BF5
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 08:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgKNHab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 02:30:31 -0500
Received: from mail.ispras.ru ([83.149.199.84]:52808 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgKNHab (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 02:30:31 -0500
Received: from mail.ispras.ru (unknown [83.149.199.84])
        by mail.ispras.ru (Postfix) with ESMTPSA id 31E4C40D3BFF;
        Sat, 14 Nov 2020 07:30:29 +0000 (UTC)
MIME-Version: 1.0
Date:   Sat, 14 Nov 2020 10:30:29 +0300
From:   baskov@ispras.ru
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] s5p-jpeg: hangle error condition in s5p_jpeg_probe
In-Reply-To: <f8c9ea26-fc55-d65d-e2b3-734af8b97c95@gmail.com>
References: <20201113160625.1281-1-baskov@ispras.ru>
 <f8c9ea26-fc55-d65d-e2b3-734af8b97c95@gmail.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <8fa69eb90dd4710bb7ae6ba2a3148ef7@ispras.ru>
X-Sender: baskov@ispras.ru
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-11-14 00:35, Jacek Anaszewski wrote:
> There is a typo in the subject: s/hangle/handle/

Thanks for pointing out, sorry for that.

Apparently, there is also a typo in my name -> s/Evgeiny/Evgeniy/

--
Respectfully,
Baskov Evgeniy
