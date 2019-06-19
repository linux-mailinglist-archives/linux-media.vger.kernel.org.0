Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D6B4B384
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 10:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfFSIBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 04:01:49 -0400
Received: from resqmta-ch2-10v.sys.comcast.net ([69.252.207.42]:54192 "EHLO
        resqmta-ch2-10v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731065AbfFSIBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 04:01:49 -0400
Received: from resomta-ch2-20v.sys.comcast.net ([69.252.207.116])
        by resqmta-ch2-10v.sys.comcast.net with ESMTP
        id dVOohD9BW8ekNdVPYhZW2v; Wed, 19 Jun 2019 07:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1560930820;
        bh=jtZ93MYxczinqiABEpJMEjrjLWcXFP4Znz193IhPL3g=;
        h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
         Content-Type;
        b=UO+5q+rLe7Wa1omZ4H/TPRv0UdsLqxci+qhwU4WZ2DxM+Rx4opffBSI9oIJjnzJ5M
         5YhBpcSu2emRdnidWFU8h9cFOOKNQd7JXBlUobs4Id024SbqJKGsJh0KheVMpCt7gd
         czq+simIH7YXXWNP4Xo4N1CqLeTtgJnLMZecMjmPthArA2bo7SG/e8oBUi6lqiaf4g
         JdMGcGsnM1sJSPG7jH+TqAVQZ6IZKU0wO9D3E324+5GdNUdseJGiS7lC4Rn03mapYg
         iqATVTjgXiKi7GfVlg/6zNpdJW12abhK80S6RIY3SZaO36fH0QamKjKEBuamQLsIVD
         PEkx8JacwgiXg==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-ch2-20v.sys.comcast.net with ESMTPA
        id dVPRheLdZdiHjdVPYh33td; Wed, 19 Jun 2019 07:53:40 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrtddugdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejfedrvdegkedrvddvtddrvdduheenucfrrghrrghmpehhvghloheplgduledvrdduieekrdegrdegngdpihhnvghtpeejfedrvdegkedrvddvtddrvdduhedpmhgrihhlfhhrohhmpegrshdutdeffeigsegtohhmtggrshhtrdhnvghtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvggrnhesmhgvshhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-Xfinity-VMeta: sc=-100;st=legit
Subject: [PATCH v2 0/3] [media] mceusb: Error message text revisions
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
From:   A Sun <as1033x@comcast.net>
Message-ID: <72ee52cb-8127-3035-a146-2784ac4265b6@comcast.net>
Date:   Wed, 19 Jun 2019 03:53:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


patch v2 revisions:
  . limit patch to message changes only in part 3/3

Several error message revisions for mceusb.c

proposed patches applicable to mceusb.c version
https://github.com/torvalds/linux/blob/master/drivers/media/rc/mceusb.c
Mar 1, 2019 commit 04ad30112aec61004f994d8f51461ec06e208e54
