Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9AEB2CCE8
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfE1RD1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:27 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:34347 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:27 -0400
Received: from tyrex.lisa.loc ([79.251.202.64]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMXDj-1hDBHe2y1f-00Jcf4 for <linux-media@vger.kernel.org>; Tue, 28 May 2019
 19:03:25 +0200
Received: from localhost (localhost [127.0.0.1])
        by tyrex.lisa.loc (Postfix) with ESMTP id 576EF241BFCAC
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 19:03:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at lisa.loc
Received: from tyrex.lisa.loc ([127.0.0.1])
        by localhost (tyrex.lisa.loc [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WLecb9RUQAC4 for <linux-media@vger.kernel.org>;
        Tue, 28 May 2019 19:03:24 +0200 (CEST)
Received: by tyrex.lisa.loc (Postfix, from userid 99)
        id BC82C241BFCB0; Tue, 28 May 2019 19:03:24 +0200 (CEST)
Received: from xrated.localnet (xrated.lisa.loc [172.16.23.107])
        by tyrex.lisa.loc (Postfix) with ESMTP id 8B846241BFCAC
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 19:03:24 +0200 (CEST)
From:   Hans-Peter Jansen <hpj@urpla.net>
To:     linux-media@vger.kernel.org
Subject: log spammed from dvb_frontend_get_frequency_limits
Date:   Tue, 28 May 2019 19:03:24 +0200
Message-ID: <3974277.jUKmpJJRZQ@xrated>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:1m/2frOXm8wQ0fXptuFPXzayrEqbuiQycdk5JNhWynYikTH18M7
 UnHsyQlP4JlrobtENEG7yMqr9VUXvI+SgUS1iE4H3OGbaNGfLtu6Uwp2144QLL6WX4yhj6x
 ZOA+AnO8OPX6Z3HWOqWWcIuPHfwqujnJKxrizICEZX65QjHXeWhRwbKv4AlOJL6XlKxRDVO
 fmbaiuOsvhvIJwIaO1Naw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TNzDyuiiOnk=:Kfk+89PY/772fr0awN56PR
 0+wyXU1KJ6qSpDy27BCkPqlbRYnllVpVgxv4uSfhk6BJKDBEx/CAzwzIaSPayup+xhY9ER4fl
 ZHafO2ftkJ1EeSRjKfHU0+JJ5NogjS3x60hAvoRJAB/P22QX4gu+wBnKFpybqiuNZO0T7ehbP
 bNolbDa6HEwxomwFfDm2NwOiDyRF0G6fKcHkjoiCSnj5scoLJouhBCSvSPAoBiI2BbMMjDUfk
 BwqkVsqVIk7O5i9dSH1N5WGGGNpNh9r0eNUxYnYCAQZnE3yR0cxSRfCx6jtcEmZcL0NSGedNT
 0VjnV5jr+pTdbUqNfrUNi7wt2yCCMH/j8TSSeSGS2ntB6Swh1JI8ybxJkG+e9cUtVv39dxeQL
 iVcgbPe5vw1le6QJufTxGuhTe3DjLzKYOsLtXirYuMO5VWjxfNi8S0e7El66QT8YPoKZB4qjY
 qVCoyBW6MO/Cowtea/b+7jEZjjc2BLDg3lLextJH9vwBwgZZXzGXJkN7cCfGI6uns0GZlDme0
 seZ3FOT4HXuRSOlkJv5ygoHKgVfFqYVuNbmPw2RLfz1BQAXSPTersZjAKJ7EhBiClcy355bEt
 Ojdmg1NzpaNAt/j9tmOStodc7p5pGCO2wVd+bZ2AoPs/mZ1OZrztc4DiGEeU0mrDB3nnXBSQf
 hN64IdlFI2b6DFCZvpgCDeWqDKWEwGZJAN+Y/0wT9cjODFzGzA6fJOHOeZXnGUJSV7rowxiY5
 NCScydJTkdGvaFqH0IazToqhk0HQrjAv9mwYzn7auar4SVaXApFeqLVTdF0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

my syslog is continuously spammed with:

2019-05-28T18:45:39.275180+02:00 kernel: [ 5666.337560] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:45:39.279201+02:00 kernel: [ 5666.343778] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:45:39.283157+02:00 kernel: [ 5666.347610] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:45:39.287130+02:00 kernel: [ 5666.351431] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:45:39.291215+02:00 kernel: [ 5666.356031] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:45:41.263233+02:00 kernel: [ 5666.359820] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:00.295235+02:00 kernel: [ 5687.357185] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:00.297391+02:00 kernel: [ 5687.362397] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:00.307104+02:00 kernel: [ 5687.367207] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:00.311125+02:00 kernel: [ 5687.374543] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:00.319201+02:00 kernel: [ 5687.378651] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:06.583637+02:00 kernel: [ 5687.387209] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:36.019149+02:00 kernel: [ 5708.370301] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:42.335100+02:00 kernel: [ 5729.394246] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:42.339235+02:00 kernel: [ 5729.403914] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:42.343145+02:00 kernel: [ 5729.408136] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:42.347206+02:00 kernel: [ 5729.411843] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:42.359164+02:00 kernel: [ 5729.416573] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:46:49.159286+02:00 kernel: [ 5729.428030] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:47:03.343190+02:00 kernel: [ 5750.387217] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:47:03.347127+02:00 kernel: [ 5750.410850] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:47:03.351173+02:00 kernel: [ 5750.415379] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:47:03.355154+02:00 kernel: [ 5750.419946] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:47:03.363228+02:00 kernel: [ 5750.424626] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000
2019-05-28T18:47:04.516165+02:00 kernel: [ 5750.429455] dvb_frontend: dvb_frontend_get_frequency_limits: frequency interval: tuner: 0...0, frontend: 300000000...2350000000

Linux kernel 5.1.5

According to https://github.com/torvalds/linux/blob/master/drivers/media/dvb-core/dvb_frontend.c#L908
this is to be expected, but for what reason?

The system is running VDR 2.2.0 with a Digital Devices Max S8.

Shouldn't this dprintk() be converted to dev_dbg(), since it doesn't buy 
much for usual operation, does it?

While at it, do you have any idea, how to avoid these:

2019-05-28T18:56:11.099140+02:00 kernel: [ 6298.161481] dmxdev: DVB (dvb_dmxdev_filter_start): could not set feed
2019-05-28T18:56:11.099154+02:00 kernel: [ 6298.161487] dvb_demux: dvb_demux_feed_del: feed not in list (type=1 state=0 pid=ffff)

It's significantly less frequent compared to the former call, but 
also quite nagging.

Thanks for consideration.

Cheers,
Pete


