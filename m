Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E236714C2E6
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 23:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgA1WTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 17:19:41 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:33655 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgA1WTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 17:19:40 -0500
Received: from 'smile.earth' ([95.89.5.152]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mgvev-1jUnUY2fXB-00hQE4 for <linux-media@vger.kernel.org>; Tue, 28 Jan 2020
 23:19:35 +0100
X-Virus-Scanned: amavisd at 'smile.earth'
From:   Hans-Peter Jansen <hpj@urpla.net>
To:     linux-media@vger.kernel.org
Subject: dvb receiving issues with Digital Devices Max S8
Date:   Tue, 28 Jan 2020 23:19:32 +0100
Message-ID: <3557338.8E7ut4xSlN@xrated>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:D+IAVqgYy53+BZi1IL8xfC4RYf74SH1j+NMOkuEYLJBGcbBLrkH
 fbDUzC2dNSjiV3LuCBkBv/N5xDoq551xHQptIeZaI7VhZZTsCGINYmpnd77m/VvFWh29xtb
 UvvjnLoD0CIH4vUNnESSz/5lVeQ1+ebyeCggKm92CWw4vILWDRte2SQAEA5tjViP/3IzpKj
 cFFvtGTIvGd98CcM7v4vw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aAeDfVeV03Y=:pVm2KNBo/DxV2qZ2vpM1hM
 uM5QfTlfXwuWjSe97RmN1fu8VgUS4aX4vpmJYFCdGsZzpaYP0wZ9qdbiHdHqE17wEzpwmy+tc
 Ri+bw04yHorSfFUS5ga6XyP1PzsF9JDrDNgqYKQgdonGh24xgK+kZE7aKyOPV/nBG4M99wHcf
 uYBIoclkPskCIsh9Ac0AL3afibHOSOcK13spXf7VZpXeD0474xbz7b9NCDCQQQgDvV4Vsaqy6
 4/ghgd820SoCBjLJsvKfMaEDyvA+kNmJ7EjwNcvTBQcrd91qXmNJIflmTRQDIxWFtX+KMIZsn
 rybJs6fr9p7gqDCqWcZS0qw6rGjwbSibdp16n7QUvFsZGsQdbPPDR/rhqc6ZsLvHii78wqrBJ
 O8LUbdsbE+n4jLN9M9yUvise7dmfiTQwIL5zD0TSMd8+BVe8XrCL5gPJBO0gi/LHo3Ine4HML
 b58QKCHkJO9kcUn/IUHPf3+lQOT2Vg3MTACXK427ocm9Tp0Llmtobq0D/PPR3t9w8DoH0ArW1
 GBnuVLyQcSFWOJahR02A0m90bhhlfW7GOg9XRV8525Ac7b6tLtMyKEmrrwX+Yo+czg/pVppgq
 6qQBGF+XqGj9uEpmVEBqdzfPr0AJSANfO1RG14LjpPPwhl/CeCUXdyEHVmRA+SelwfzJ5OA+5
 70xNubN4sYIOVDBKRVEna43lieXuunHdsS9eEJBh53bwHyxdQUEG73vzW91xewbqxI8i8FlgU
 QbZOiM1dbAbbNFaMfaYe7Bsf0B8B1+O3WcH/hOkx9qZRkAxO3JXhjF3O5Kg5DhRd1pUdwjOA3
 JlQ2KfKbpEO1OEDIPYddoiJMgXgknpr+PI99rq8EOmmVzARoZM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm struggling with some receiving issues from a Max S8 8 channel dvb device,
using the ddbridge driver, as found in 5.4.13. The dvb card is driven from vdr
2.4.1 (openSUSE 15.1). 

The issues the the mpeg transport streams reveal, if encoding the stream into
somethinng more usual (I use Handbrake from current GIT, with ffmpeg 4.2.2),
resulting in:

x264 [info]: using SAR=1/1
x264 [info]: using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2
x264 [info]: profile Main, level 4.0
[22:18:42] sync: first pts video is 0
[22:18:42] sync: first pts audio 0x503 is 18790
Encoding: 1.48 % (35.68 fps, avg 33.86 fps, ETA 00h31m21s, 0 SE)
[22:19:11] stream: error near frame 2025: missing start code
Encoding: 1.54 % (29.56 fps, avg 33.29 fps, ETA 00h31m51s, 1 SE)
[22:19:13] sync: video time went backwards 40 ms, dropped 1 frames. PTS 3621600
[22:19:13] sync: video time went backwards 40 ms, dropped 1 frames. PTS 3628800
Encoding: 1.56 % (29.56 fps, avg 33.29 fps, ETA 00h31m51s, 1 SE)
[22:19:13] sync: video time went backwards 40 ms, dropped 1 frames. PTS 3636000
Encoding: 1.57 % (29.56 fps, avg 33.29 fps, ETA 00h31m51s, 1 SE)
[22:19:13] sync: video time went backwards 40 ms, dropped 1 frames. PTS 3643200
Encoding: 7.41 % (25.52 fps, avg 31.30 fps, ETA 00h31m52s, 1 SE)
[22:21:16] stream: 85 new errors (1%) up to frame 9718: missing start code
Encoding: 7.44 % (25.52 fps, avg 31.30 fps, ETA 00h31m52s, 86 SE)
[ac3 @ 0x7f3c5403a5c0] expacc 127 is out-of-range
Encoding: 12.55 % (32.48 fps, avg 30.78 fps, ETA 00h30m36s, 86 SE)
[22:23:06] stream: 29 new errors (0%) up to frame 16381: missing start code
[h264 @ 0x7f3c1003e540] Reference 3 >= 2
[h264 @ 0x7f3c1003e540] error while decoding MB 49 32, bytestream 13269

These typically are noticeable as short blocky disruptions up to dropouts in
seconds range. After enabling dvb_core and ddbridge debug options, these 
messages appear (~12 secs worth of logs, with 
dvb_dmxdev_section_callback|dvb_dvr_poll|dvb_dmxdev_filter_set filtered out):

2020-01-28T20:16:59.265184+01:00 kernel: [ 2179.256180] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.325090+01:00 kernel: [ 2179.316700] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.345179+01:00 kernel: [ 2179.337250] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.376972+01:00 kernel: [ 2179.366607] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58283 Kbits/sec 
2020-01-28T20:16:59.392985+01:00 kernel: [ 2179.386095] dvb_demux: dvb_dmx_swfilter_packet: TS speed 41443 Kbits/sec 
2020-01-28T20:16:59.418740+01:00 kernel: [ 2179.410448] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x14 expected 0x4 got 0x0
2020-01-28T20:16:59.425221+01:00 kernel: [ 2179.418234] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.445221+01:00 kernel: [ 2179.438328] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.813200+01:00 kernel: [ 2179.802872] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.853304+01:00 kernel: [ 2179.843381] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.911516+01:00 kernel: [ 2179.904378] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:16:59.992901+01:00 kernel: [ 2179.985398] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:00.053222+01:00 kernel: [ 2180.045823] dvb_demux: dvb_dmx_swfilter_packet: TS speed 37014 Kbits/sec 
2020-01-28T20:17:00.053263+01:00 kernel: [ 2180.045885] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.177239+01:00 kernel: [ 2180.167437] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.197125+01:00 kernel: [ 2180.186538] dvb_demux: dvb_dmx_swfilter_packet: TS speed 47904 Kbits/sec 
2020-01-28T20:17:00.337276+01:00 kernel: [ 2180.329469] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.364996+01:00 kernel: [ 2180.358007] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:00.398457+01:00 kernel: [ 2180.390560] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.435772+01:00 kernel: [ 2180.428970] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:00.461246+01:00 kernel: [ 2180.451011] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.601085+01:00 kernel: [ 2180.593183] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.637059+01:00 kernel: [ 2180.626527] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:00.661262+01:00 kernel: [ 2180.653602] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.717161+01:00 kernel: [ 2180.706860] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:00.745201+01:00 kernel: [ 2180.734584] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.844981+01:00 kernel: [ 2180.836243] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.865079+01:00 kernel: [ 2180.856197] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:00.905159+01:00 kernel: [ 2180.896684] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.068391+01:00 kernel: [ 2181.058657] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.129230+01:00 kernel: [ 2181.119828] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.129245+01:00 kernel: [ 2181.121752] dvb_demux: dvb_dmx_swfilter_packet: TS speed 42326 Kbits/sec 
2020-01-28T20:17:01.147818+01:00 kernel: [ 2181.139793] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.169228+01:00 kernel: [ 2181.160306] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.451378+01:00 kernel: [ 2181.443912] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.492475+01:00 kernel: [ 2181.484400] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.697207+01:00 kernel: [ 2181.689314] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58283 Kbits/sec 
2020-01-28T20:17:01.727982+01:00 kernel: [ 2181.721140] dvb_demux: dvb_dmx_swfilter_packet: TS speed 47872 Kbits/sec 
2020-01-28T20:17:01.797246+01:00 kernel: [ 2181.787949] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.837232+01:00 kernel: [ 2181.828474] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.869127+01:00 kernel: [ 2181.861428] dvb_demux: dvb_dmx_swfilter_packet: TS speed 59511 Kbits/sec 
2020-01-28T20:17:01.936977+01:00 kernel: [ 2181.930045] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:01.978393+01:00 kernel: [ 2181.970430] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:02.041121+01:00 kernel: [ 2182.030923] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:02.161248+01:00 kernel: [ 2182.152532] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.353152+01:00 kernel: [ 2182.343179] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:02.385190+01:00 kernel: [ 2182.375672] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.405205+01:00 kernel: [ 2182.395668] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.465073+01:00 kernel: [ 2182.456703] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.637101+01:00 kernel: [ 2182.626763] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x14 expected 0x0 got 0xe
2020-01-28T20:17:02.689151+01:00 kernel: [ 2182.679201] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.699834+01:00 kernel: [ 2182.692120] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:02.749052+01:00 kernel: [ 2182.740320] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.769219+01:00 kernel: [ 2182.760196] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.789103+01:00 kernel: [ 2182.780791] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:02.901057+01:00 kernel: [ 2182.894032] dvb_demux: dvb_dmx_swfilter_packet: TS speed 41443 Kbits/sec 
2020-01-28T20:17:02.957026+01:00 kernel: [ 2182.949247] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:03.111825+01:00 kernel: [ 2183.104893] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.129061+01:00 kernel: [ 2183.121293] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:03.133169+01:00 kernel: [ 2183.124893] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.253367+01:00 kernel: [ 2183.246573] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.265003+01:00 kernel: [ 2183.254846] dvb_demux: dvb_dmx_swfilter_packet: TS speed 47904 Kbits/sec 
2020-01-28T20:17:03.297008+01:00 kernel: [ 2183.286831] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.356072+01:00 kernel: [ 2183.347977] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.417206+01:00 kernel: [ 2183.408501] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.477140+01:00 kernel: [ 2183.469583] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.577343+01:00 kernel: [ 2183.570533] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.681155+01:00 kernel: [ 2183.672068] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.741210+01:00 kernel: [ 2183.732553] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.761143+01:00 kernel: [ 2183.753107] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.781205+01:00 kernel: [ 2183.773087] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.821237+01:00 kernel: [ 2183.813646] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.885146+01:00 kernel: [ 2183.874583] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:03.925163+01:00 kernel: [ 2183.915192] dvb_demux: dvb_dmx_swfilter_packet: TS speed 37776 Kbits/sec 
2020-01-28T20:17:03.985088+01:00 kernel: [ 2183.975648] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.025204+01:00 kernel: [ 2184.016010] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:04.044833+01:00 kernel: [ 2184.036708] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.105169+01:00 kernel: [ 2184.097141] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.185184+01:00 kernel: [ 2184.178197] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.193080+01:00 kernel: [ 2184.184117] dvb_demux: dvb_dmx_swfilter_packet: TS speed 59511 Kbits/sec 
2020-01-28T20:17:04.297166+01:00 kernel: [ 2184.287830] dvb_demux: dvb_dmx_swfilter_packet: TS speed 37776 Kbits/sec 
2020-01-28T20:17:04.389245+01:00 kernel: [ 2184.381690] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58283 Kbits/sec 
2020-01-28T20:17:04.531664+01:00 kernel: [ 2184.522802] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.645127+01:00 kernel: [ 2184.636802] dvb_demux: dvb_dmx_swfilter_packet: TS speed 37776 Kbits/sec 
2020-01-28T20:17:04.673185+01:00 kernel: [ 2184.664318] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.673223+01:00 kernel: [ 2184.666402] dvb_demux: dvb_dmx_swfilter_packet: TS speed 41443 Kbits/sec 
2020-01-28T20:17:04.753276+01:00 kernel: [ 2184.745407] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.769177+01:00 kernel: [ 2184.758517] dvb_demux: dvb_dmx_swfilter_packet: TS speed 48860 Kbits/sec 
2020-01-28T20:17:04.837234+01:00 kernel: [ 2184.826493] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:04.877107+01:00 kernel: [ 2184.866975] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.037120+01:00 kernel: [ 2185.028896] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.241134+01:00 kernel: [ 2185.231530] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.361235+01:00 kernel: [ 2185.353094] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.441113+01:00 kernel: [ 2185.434065] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.453057+01:00 kernel: [ 2185.444046] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:05.485211+01:00 kernel: [ 2185.474588] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.545212+01:00 kernel: [ 2185.535637] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.649100+01:00 kernel: [ 2185.641675] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:05.765115+01:00 kernel: [ 2185.758144] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.909180+01:00 kernel: [ 2185.900288] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:05.949160+01:00 kernel: [ 2185.940789] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:05.967647+01:00 kernel: [ 2185.960791] dvb_demux: dvb_dmx_swfilter_packet: TS speed 37776 Kbits/sec 
2020-01-28T20:17:06.089188+01:00 kernel: [ 2186.082245] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:06.133228+01:00 kernel: [ 2186.122797] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:06.281126+01:00 kernel: [ 2186.273003] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:06.301138+01:00 kernel: [ 2186.292319] dvb_demux: dvb_dmx_swfilter_packet: TS speed 47904 Kbits/sec 
2020-01-28T20:17:06.313158+01:00 kernel: [ 2186.305379] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:06.445029+01:00 kernel: [ 2186.438068] dvb_demux: dvb_dmx_swfilter_packet: TS speed 41466 Kbits/sec 
2020-01-28T20:17:06.537170+01:00 kernel: [ 2186.528009] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:06.628835+01:00 kernel: [ 2186.621957] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:06.697106+01:00 kernel: [ 2186.689980] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:06.711521+01:00 kernel: [ 2186.704441] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58283 Kbits/sec 
2020-01-28T20:17:06.909066+01:00 kernel: [ 2186.902122] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58283 Kbits/sec 
2020-01-28T20:17:06.941134+01:00 kernel: [ 2186.933064] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.001084+01:00 kernel: [ 2186.994211] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.021163+01:00 kernel: [ 2187.014102] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.145083+01:00 kernel: [ 2187.135646] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.325200+01:00 kernel: [ 2187.318336] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.429056+01:00 kernel: [ 2187.419185] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.449133+01:00 kernel: [ 2187.439810] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.469260+01:00 kernel: [ 2187.459788] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.549220+01:00 kernel: [ 2187.540685] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.669037+01:00 kernel: [ 2187.662163] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.753181+01:00 kernel: [ 2187.743334] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.793287+01:00 kernel: [ 2187.783844] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.833466+01:00 kernel: [ 2187.824387] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.837057+01:00 kernel: [ 2187.826830] dvb_demux: dvb_dmx_swfilter_packet: TS speed 47872 Kbits/sec 
2020-01-28T20:17:07.853050+01:00 kernel: [ 2187.844954] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.873175+01:00 kernel: [ 2187.864819] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:07.893126+01:00 kernel: [ 2187.885361] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:07.953205+01:00 kernel: [ 2187.945865] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:07.973049+01:00 kernel: [ 2187.964415] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:08.076225+01:00 kernel: [ 2188.067465] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.169152+01:00 kernel: [ 2188.162055] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:08.221083+01:00 kernel: [ 2188.210311] dvb_demux: dvb_dmx_swfilter_packet: TS speed 41443 Kbits/sec 
2020-01-28T20:17:08.265092+01:00 kernel: [ 2188.258115] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:08.301157+01:00 kernel: [ 2188.290523] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.319826+01:00 kernel: [ 2188.310541] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.421082+01:00 kernel: [ 2188.412036] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.501181+01:00 kernel: [ 2188.493151] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.617083+01:00 kernel: [ 2188.607078] dvb_demux: dvb_dmx_swfilter_packet: TS speed 36995 Kbits/sec 
2020-01-28T20:17:08.685214+01:00 kernel: [ 2188.675093] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.723716+01:00 kernel: [ 2188.715640] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.783653+01:00 kernel: [ 2188.776661] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.845190+01:00 kernel: [ 2188.837187] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.905111+01:00 kernel: [ 2188.898245] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:08.925170+01:00 kernel: [ 2188.918130] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.049280+01:00 kernel: [ 2189.039715] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.109108+01:00 kernel: [ 2189.100807] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.169261+01:00 kernel: [ 2189.161249] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.189099+01:00 kernel: [ 2189.181800] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.231673+01:00 kernel: [ 2189.224801] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58283 Kbits/sec 
2020-01-28T20:17:09.293112+01:00 kernel: [ 2189.282781] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.367757+01:00 kernel: [ 2189.360623] dvb_demux: dvb_dmx_swfilter_packet: TS speed 47904 Kbits/sec 
2020-01-28T20:17:09.393132+01:00 kernel: [ 2189.384415] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.405100+01:00 kernel: [ 2189.396829] dvb_demux: dvb_dmx_swfilter_packet: TS speed 59511 Kbits/sec 
2020-01-28T20:17:09.637151+01:00 kernel: [ 2189.627452] dmxdev: dvb_dmxdev_buffer_write: buffer overflow
2020-01-28T20:17:09.955127+01:00 kernel: [ 2189.946598] dvb_demux: dvb_dmx_swfilter_packet: TS speed 42302 Kbits/sec 
2020-01-28T20:17:10.492982+01:00 kernel: [ 2190.484752] dvb_demux: dvb_dmx_swfilter_packet: TS speed 58329 Kbits/sec 
2020-01-28T20:17:10.749266+01:00 kernel: [ 2190.742348] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x1a40 expected 0x0 got 0xa
2020-01-28T20:17:10.749267+01:00 kernel: [ 2190.742351] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x196e expected 0x0 got 0xd
2020-01-28T20:17:10.749268+01:00 kernel: [ 2190.742353] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x19d2 expected 0x5 got 0xa
2020-01-28T20:17:10.749270+01:00 kernel: [ 2190.742355] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x1a36 expected 0x8 got 0x1
2020-01-28T20:17:10.749271+01:00 kernel: [ 2190.742357] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x1a4a expected 0x4 got 0x3
2020-01-28T20:17:10.749273+01:00 kernel: [ 2190.742360] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x1978 expected 0xd got 0x8
2020-01-28T20:17:10.749274+01:00 kernel: [ 2190.742364] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x1a42 expected 0x7 got 0x5
2020-01-28T20:17:10.749276+01:00 kernel: [ 2190.742369] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x19de expected 0xd got 0xe
2020-01-28T20:17:10.749277+01:00 kernel: [ 2190.742372] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x197b expected 0x4 got 0xa
2020-01-28T20:17:10.749278+01:00 kernel: [ 2190.742375] dvb_demux: dvb_dmx_swfilter_packet: TS packet counter mismatch. PID=0x19dc expected 0x0 got 0xb
2020-01-28T20:17:11.012870+01:00 kernel: [ 2191.004726] dvb_demux: dvb_dmx_swfilter_packet: TS speed 23545 Kbits/sec 
2020-01-28T20:17:11.083165+01:00 kernel: [ 2191.074981] dvb_demux: dvb_dmx_swfilter_packet: TS speed 23469 Kbits/sec 
2020-01-28T20:17:11.437065+01:00 kernel: [ 2191.427620] dvb_demux: dvb_dmx_swfilter_packet: TS speed 23173 Kbits/sec 

I already raised dma_buf_num=16 and dma_buf_size=32 for ddbridge, but that
didn't cut it as well. More or less all recordings suffer from this behavior
to a certain degree, but most prominently CAM based ones with high pixel 
rates..

Here are the messages from the drivers start:

<6>[    0.583940] pci 0000:02:00.0: [dd01:0007] type 00 class 0x048000
<6>[    0.583972] pci 0000:02:00.0: reg 0x10: [mem 0xfacf0000-0xfacfffff 64bit]
<6>[   44.940025] ddbridge: Digital Devices PCIE bridge driver 0.9.33-integrated, Copyright (C) 2010-17 Digital Devices GmbH
<6>[   44.940159] ddbridge 0000:02:00.0: detected Digital Devices MAX S8 4/8
<6>[   44.940174] ddbridge 0000:02:00.0: HW 0101000f REGMAP 00010002
<6>[   44.940217] ddbridge 0000:02:00.0: using 1 MSI interrupt(s)
<6>[   45.120633] ddbridge 0000:02:00.0: Port 0: Link 0, Link Port 0 (TAB 1): DUAL DVB-S2 MAX
<6>[   45.120638] ddbridge 0000:02:00.0: Port 1: Link 0, Link Port 1 (TAB 2): DUAL DVB-S2 MAX
<6>[   45.120641] ddbridge 0000:02:00.0: Port 2: Link 0, Link Port 2 (TAB 3): DUAL DVB-S2 MAX
<6>[   45.120644] ddbridge 0000:02:00.0: Port 3: Link 0, Link Port 3 (TAB 4): DUAL DVB-S2 MAX
<6>[   45.123813] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   45.123816] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   45.123816] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   45.123817] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   45.123818] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   45.123818] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   45.123819] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   45.123820] dvbdev: DVB: registering new adapter (DDBridge)
<6>[   49.847611] ddbridge 0000:02:00.0: Read mxl_fw from link 0

The card doesn't share its interrupt with other hardware, and the system
runs with swap disabled, using a Xeon X3460 @ 2.80GHz with 24 GB RAM.

<6>[    0.310602] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
<6>[    0.310607] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier

No further sysctl tunings, but transparent_hugepage=never is set.

The load is moderate.

Questions: is there a probability of a relationship of these buffer 
overflow events and the distorted TS, although VDR seems to operate 
properly?

Am I miss something obvious?

Anything else, that I could do to mitigate these issues?

Thanks,
Pete


